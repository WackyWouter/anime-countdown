import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animecountdown/constant.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/input_text_field.dart';
import 'package:animecountdown/widgets/login_mode.dart';
import 'package:animecountdown/widgets/thin_outline_btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ColorThemeWizard themeWizard = ColorThemeWizard();
  bool loginMode = true;

  void changeMode() {
    setState(() {
      loginMode = !loginMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = themeWizard.getPrimaryColor();
    Color darkColor = themeWizard.getDarkColor();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: themeWizard.getLoginBackground(), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                child: Image(
                  height: 300.0,
                  image: AssetImage("assets/images/noface.png"),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LoginMode(
                          text: "Register",
                          color: loginMode ? kGreyAccent : primaryColor,
                          align: Alignment.centerRight,
                          onTap: () {
                            changeMode();
                          },
                        ),
                        VerticalDivider(
                          width: 75.0,
                          thickness: 2.0,
                          color: kGreyAccent,
                        ),
                        LoginMode(
                          text: "Login",
                          color: loginMode ? primaryColor : kGreyAccent,
                          align: Alignment.centerLeft,
                          onTap: () {
                            changeMode();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        InputTextField(
                          obscureText: false,
                          onChanged: () {},
                          icon: FontAwesomeIcons.user,
                          iconColor: primaryColor,
                          hintText: 'Username',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        InputTextField(
                          obscureText: true,
                          onChanged: () {},
                          icon: FontAwesomeIcons.lock,
                          iconColor: primaryColor,
                          hintText: 'Password',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ThinOutlineBtn(
                      primaryColor: primaryColor,
                      darkColor: darkColor,
                      text: loginMode ? 'LOGIN' : 'REGISTER',
                      ontap: () {}),
                ],
              ),
            ],
          )),
    );
  }
}
