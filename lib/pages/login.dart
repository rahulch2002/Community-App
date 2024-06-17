import 'package:flutter/material.dart';

import 'package:messaging_app/components/text_field.dart';
import 'package:messaging_app/components/auth_button.dart';
import 'package:messaging_app/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final void Function() ontap;
  const Login({super.key, required this.ontap()});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void signIn() async {
    AuthService authService = Provider.of<AuthService>(context);

    try {
      await authService.signInWithEmailPass(
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
            const SizedBox(height: 25),
            MyButton(text: 'Sign In', ontap: () => signIn()),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? "),
                GestureDetector(
                  onTap: () => widget.ontap(),
                  child: Text(
                    "Register Now",
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
