import 'package:animecountdown/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:animecountdown/widgets/input_text_field.dart';
import 'package:animecountdown/widgets/thin_outline_btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animecountdown/models/php_api.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String id = 'change_password_screen';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String error = '';
  String oldPassword = '';
  String confirmNewPassword = '';
  String newPassword = '';
  bool inProgress = false;

  @override
  Widget build(BuildContext context) {
    PhpApi.checkToken();
    return Consumer<ColorThemeWizard>(builder: (context, themeWizard, child) {
      return Loading(
        iconColor: themeWizard.getPrimaryColor(),
        inProgress: inProgress,
        child: Material(
            type: MaterialType.transparency,
            child: Column(
              children: <Widget>[
                TitleBar(title: 'CHANGE PASSWORD'),
                Expanded(
                    child: Container(
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
                                      textColor: themeWizard.getCardTextColor(),
                                      loginBoxColor:
                                          themeWizard.getLoginBoxColor(),
                                      onChange: (value) {
                                        oldPassword = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    InputTextField(
                                      obscureText: true,
                                      icon: FontAwesomeIcons.lock,
                                      primaryColor:
                                          themeWizard.getPrimaryColor(),
                                      hintText: "New Password",
                                      textColor: themeWizard.getCardTextColor(),
                                      loginBoxColor:
                                          themeWizard.getLoginBoxColor(),
                                      onChange: (value) {
                                        newPassword = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InputTextField(
                                      obscureText: true,
                                      icon: FontAwesomeIcons.lock,
                                      primaryColor:
                                          themeWizard.getPrimaryColor(),
                                      hintText: "Confirm New Password",
                                      textColor: themeWizard.getCardTextColor(),
                                      loginBoxColor:
                                          themeWizard.getLoginBoxColor(),
                                      onChange: (value) {
                                        confirmNewPassword = value;
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        error,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: themeWizard.getPrimaryColor(),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ThinOutlineBtn(
                                  primaryColor: themeWizard.getPrimaryColor(),
                                  darkColor: themeWizard.getBackgroundColor(),
                                  text: "Confirm",
                                  highlightedBorderColor:
                                      themeWizard.getPrimaryColor(),
                                  ontap: () async {
                                    setState(() {
                                      inProgress = true;
                                    });
                                    try {
                                      String errorMessage = '';
                                      if (newPassword.length > 0 &&
                                          confirmNewPassword.length > 0 &&
                                          oldPassword.length > 0) {
                                        if (newPassword == confirmNewPassword) {
                                          if (await PhpApi.changePassword(
                                              oldPassword, newPassword)) {
                                            Navigator.of(context).popUntil(
                                                (route) => route.isFirst);
                                          } else {
                                            errorMessage = PhpApi.latestError;
                                          }
                                        } else {
                                          errorMessage =
                                              "New password and Confirm password dont match";
                                        }
                                      } else {
                                        errorMessage = "Password(s) are empty";
                                      }
                                      setState(() {
                                        error = errorMessage;
                                      });
                                    } catch (e) {
                                      setState(() {
                                        error = e;
                                      });
                                    } finally {
                                      setState(() {
                                        inProgress = false;
                                      });
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            )),
      );
    });
  }
}
