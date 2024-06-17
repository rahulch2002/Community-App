import 'package:flutter/material.dart';
import 'package:messaging_app/pages/login.dart';
import 'package:messaging_app/pages/register.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool member = true;

  void onTap() {
    setState(() {
      member = !member;
    });
  }

  @override
  Widget build(BuildContext context) {
    return member ? Login(ontap: onTap) : Register(ontap: onTap);
  }
}
