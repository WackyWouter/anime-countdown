import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:animecountdown/widgets/input_text_field.dart';
import 'package:animecountdown/widgets/thin_outline_btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String id = 'change_password_screen';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Column(
          children: <Widget>[
            TitleBar(title: 'CHANGE PASSWORD'),
            Expanded(
              child: Consumer<ColorThemeWizard>(
                  builder: (context, themeWizard, child) {
                return Container(
                  color: themeWizard.getBackgroundColor(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: themeWizard.getCardColor(),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              boxShadow: themeWizard.getCurrentMode()
                                  ? null
                                  : [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                          height: 375,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    InputTextField(
                                        obscureText: true,
                                        icon: FontAwesomeIcons.lock,
                                        primaryColor:
                                            themeWizard.getPrimaryColor(),
                                        hintText: "Old Password",
                                        textColor:
                                            themeWizard.getCardTextColor(),
                                        loginBoxColor:
                                            themeWizard.getLoginBoxColor()),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    InputTextField(
                                        obscureText: true,
                                        icon: FontAwesomeIcons.lock,
                                        primaryColor:
                                            themeWizard.getPrimaryColor(),
                                        hintText: "New Password",
                                        textColor:
                                            themeWizard.getCardTextColor(),
                                        loginBoxColor:
                                            themeWizard.getLoginBoxColor()),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InputTextField(
                                        obscureText: true,
                                        icon: FontAwesomeIcons.lock,
                                        primaryColor:
                                            themeWizard.getPrimaryColor(),
                                        hintText: "Confirm New Passowrd",
                                        textColor:
                                            themeWizard.getCardTextColor(),
                                        loginBoxColor:
                                            themeWizard.getLoginBoxColor()),
                                  ],
                                ),
                                ThinOutlineBtn(
                                  primaryColor: themeWizard.getPrimaryColor(),
                                  darkColor: themeWizard.getBackgroundColor(),
                                  text: "Confirm",
                                  highlightedBorderColor:
                                      themeWizard.getPrimaryColor(),
                                  ontap: () {
//                                	TODO add change password
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ));
  }
}
