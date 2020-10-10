import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animecountdown/constant.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ColorThemeWizard themeWizard = ColorThemeWizard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: themeWizard.getLoginBackground())),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[Flexible()],
          )),
    );
  }
}
