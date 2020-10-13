import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animecountdown/constant.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ColorThemeWizard themeWizard = ColorThemeWizard();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = themeWizard.getPrimaryColor();
    Color secondaryColor = themeWizard.getSecondaryColor();
    Color darkColor = themeWizard.getDarkColor();
    Color cardTextColor = themeWizard.getCardTextColor();
    bool darkMode = themeWizard.getCurrentMode();

    return Column(
      children: <Widget>[
        Container(
          color: secondaryColor,
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
          color: darkColor,
          width: double.infinity,
          height: 20.0,
        ),
        Column(
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
                        style: TextStyle(color: cardTextColor, fontSize: 23.0),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    FontAwesomeIcons.moon,
                                    color: primaryColor,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  'Dark Mode',
                                  style: TextStyle(
                                      color: cardTextColor, fontSize: 20.0),
                                ),
                              ],
                            ),
                            Switch(
                              value: darkMode,
                              onChanged: (values) {
                                setState(() {
                                  themeWizard.changeMode();
                                });
                              },
                              activeColor: primaryColor,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
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
                                      color: cardTextColor, fontSize: 20.0),
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
                          ]),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
