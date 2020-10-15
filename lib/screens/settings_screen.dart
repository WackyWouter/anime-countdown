import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animecountdown/constant.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorThemeWizard>(builder: (context, themeWizard, child) {
      return Column(
        children: <Widget>[
          Container(
            color: themeWizard.getPrimaryColor(),
            width: double.infinity,
            height: 120.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: themeWizard.getSecondaryColor(),
            width: double.infinity,
            height: 20.0,
          ),
          Expanded(
            child: Container(
              color: themeWizard.getBackgroundColor(),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: themeWizard.getCardColor(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Theme',
                              style: TextStyle(
                                  color: themeWizard.getCardColor(),
                                  fontSize: 23.0),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          FontAwesomeIcons.moon,
                                          color: themeWizard.getPrimaryColor(),
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        'Dark Mode',
                                        style: TextStyle(
                                            color:
                                                themeWizard.getCardTextColor(),
                                            fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                  Switch(
                                    value: themeWizard.getCurrentMode(),
                                    onChanged: (values) {
                                      setState(() {
                                        themeWizard.changeMode();
                                      });
                                    },
                                    activeColor: themeWizard.getPrimaryColor(),
                                    activeTrackColor: kGreyAccent,
                                  ),
                                ]),
                            Divider(
                              height: 10.0,
                              thickness: 2.0,
                              color: kGreyAccent,
                              indent: 45,
                              endIndent: 20,
                            ),
                            Row(
//                          TODO create a popup
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          FontAwesomeIcons.palette,
                                          color: themeWizard.getPrimaryColor(),
                                          size: 30,
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              FontAwesomeIcons.palette,
                                              color: primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                          Text(
                                            'Change Color',
                                            style: TextStyle(
                                                color: cardTextColor,
                                                fontSize: 20.0),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          FontAwesomeIcons.chevronRight,
                                          color: primaryColor,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
