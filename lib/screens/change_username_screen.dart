import 'package:animecountdown/widgets/input_text_field.dart';
import 'package:animecountdown/widgets/thin_outline_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:animecountdown/models/php_api.dart';
import 'package:animecountdown/widgets/loading.dart';

class ChangeUsernameScreen extends StatefulWidget {
  static const String id = 'change_username_screen';

  @override
  _ChangeUsernameScreenState createState() => _ChangeUsernameScreenState();
}

class _ChangeUsernameScreenState extends State<ChangeUsernameScreen> {
  String error = '';
  String username = '';
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
                TitleBar(title: 'CHANGE USERNAME'),
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
                          height: 180,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InputTextField(
                                  obscureText: false,
                                  icon: FontAwesomeIcons.user,
                                  primaryColor: themeWizard.getPrimaryColor(),
                                  hintText: "New Username",
                                  textColor: themeWizard.getCardTextColor(),
                                  loginBoxColor: themeWizard.getLoginBoxColor(),
                                  onChange: (value) {
                                    username = value;
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
                                      if (username.length > 0) {
                                        if (await PhpApi.changeUsername(
                                            username)) {
                                          Navigator.of(context).popUntil(
                                              (route) => route.isFirst);
                                        } else {
                                          errorMessage = PhpApi.latestError;
                                        }
                                      } else {
                                        errorMessage = "Username is empty";
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
