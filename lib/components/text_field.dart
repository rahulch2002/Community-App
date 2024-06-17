import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String hintText;
  final bool obscure;
  MyTextField(
      {required this.hintText,
      required this.obscure,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
            hintText: hintText,
            filled: true,
            fillColor: Theme.of(context).colorScheme.secondary,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary))),
      ),
    );
  }
}
