import 'package:flutter/material.dart';
import 'package:animecountdown/constant.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
