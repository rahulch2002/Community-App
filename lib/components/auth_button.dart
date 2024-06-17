import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() ontap;
  const MyButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(),
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        )),
      ),
    );
  }
}
