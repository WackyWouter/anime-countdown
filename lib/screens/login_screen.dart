import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animecountdown/constant.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/input_text_field.dart';
import 'package:animecountdown/widgets/login_mode.dart';
import 'package:animecountdown/widgets/thin_outline_btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animecountdown/screens/navigator_screen.dart';
import 'package:animecountdown/models/php_api.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/widgets/loading.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool inProgress = false;
  bool loginMode = true;
  String username = '';
  String password = '';
  String error = '';

  void changeMode() {
    setState(() {
      loginMode = !loginMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorThemeWizard>(builder: (context, themeWizard, child) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: themeWizard.getLoginBackground(), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Loading(
              iconColor: themeWizard.getPrimaryColor(),
              inProgress: inProgress,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
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
                                color: loginMode
                                    ? kGreyAccent
                                    : themeWizard.getPrimaryColor(),
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
                                color: loginMode
                                    ? themeWizard.getPrimaryColor()
                                    : kGreyAccent,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InputTextField(
                                obscureText: false,
                                icon: FontAwesomeIcons.user,
                                primaryColor: themeWizard.getPrimaryColor(),
                                hintText: 'Username',
                                loginBoxColor: themeWizard.getLoginBoxColor(),
                                textColor: themeWizard.getCardTextColor(),
                                onChange: (value) {
                                  username = value;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              InputTextField(
                                obscureText: true,
                                icon: FontAwesomeIcons.lock,
                                primaryColor: themeWizard.getPrimaryColor(),
                                hintText: 'Password',
//                              error: error,
                                loginBoxColor: themeWizard.getLoginBoxColor(),
                                textColor: themeWizard.getCardTextColor(),
                                onChange: (value) {
                                  password = value;
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ThinOutlineBtn(
                            primaryColor: themeWizard.getPrimaryColor(),
                            darkColor: themeWizard.getDarkColor(),
                            text: loginMode ? 'LOGIN' : 'REGISTER',
                            ontap: () async {
                              setState(() {
                                inProgress = true;
                              });
                              try {
                                String errorMessage = '';
                                if (username.length > 0 &&
                                    password.length > 0) {
                                  if (await PhpApi.login(
                                      loginMode, username, password)) {
                                    Navigator.pushReplacementNamed(
                                        context, NavigatorScreen.id);
                                  } else {
                                    errorMessage = PhpApi.latestError;
                                  }
                                } else {
                                  errorMessage =
                                      "Password and/or Username is empty";
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
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      );
    });
  }
}
//ModalProgressHUD(
//progressIndicator: Container(
//height: 100,
//width: 100,
//child: LoadingIndicator(
//indicatorType: Indicator.pacman,
//color: themeWizard.getPrimaryColor(),
//),
//),
//inAsyncCall: inProgress,
//color: kLoadingBackground,
//child:
