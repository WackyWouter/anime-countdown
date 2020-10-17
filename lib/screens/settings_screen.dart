import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/color_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animecountdown/constant.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:animecountdown/widgets/settings_row.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleBar(title: 'SETTINGS'),
        Expanded(child: Consumer<ColorThemeWizard>(
          builder: (context, themeWizard, child) {
            return Container(
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
                                  color: themeWizard.getCardTextColor(),
                                  fontSize: 23.0),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            SettingsRow(
                              icon: FontAwesomeIcons.moon,
                              text: 'Dark Mode',
                              button: Switch(
                                value: themeWizard.getCurrentMode(),
                                onChanged: (values) {
                                  setState(() {
                                    themeWizard.changeMode();
                                  });
                                },
                                activeColor: themeWizard.getPrimaryColor(),
                                activeTrackColor: kGreyAccent,
                              ),
                            ),
                            Divider(
                              height: 10.0,
                              thickness: 2.0,
                              color: kGreyAccent,
                              indent: 45,
                              endIndent: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        ColorDialog());
//                                themeWizard.changeColor('Red');
                              },
                              child: SettingsRow(
                                icon: FontAwesomeIcons.palette,
                                text: 'Change Color',
                                button: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: themeWizard.getPrimaryColor(),
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ))
      ],
    );
  }
}
