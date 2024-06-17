import 'package:flutter/material.dart';

import 'package:messaging_app/components/text_field.dart';
import 'package:messaging_app/components/auth_button.dart';
import 'package:messaging_app/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  final void Function() ontap;
  const Register({super.key, required this.ontap()});

  @override
  State<Register> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  void signUp() async {
    AuthService authService = Provider.of<AuthService>(context);
    if (passController.text != confirmPassController.text) {
      setState(() {
        confirmPassController.clear();
        passController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords should match while confirming!')));
      return;
    }
    try {
      await authService.signUpWithEmailPass(
          emailController.value.text, passController.value.text);
    } on Exception catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "Welcome Back, you've been found!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
                hintText: 'Email', controller: emailController, obscure: false),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                hintText: 'Password',
                obscure: true,
                controller: passController),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                hintText: 'Confirm Password',
                obscure: true,
                controller: confirmPassController),
            const SizedBox(height: 25),
            MyButton(text: 'Sign Up', ontap: () => signUp()),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already a member? "),
                GestureDetector(
                  onTap: () => widget.ontap(),
                  child: Text(
                    "Login Now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
