import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/color_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animecountdown/constant.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:animecountdown/widgets/settings_row.dart';
import 'package:animecountdown/widgets/settings_card.dart';
import 'package:animecountdown/models/php_api.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    PhpApi.checkToken();
    return Column(
      children: <Widget>[
        TitleBar(title: 'SETTINGS'),
        Expanded(child: Consumer<ColorThemeWizard>(
          builder: (context, themeWizard, child) {
            return Container(
              color: themeWizard.getBackgroundColor(),
              child: Column(
                children: <Widget>[
                  SettingsCard(
                    height: 180,
                    heading: "SETTINGS",
                    widget1: SettingsRow(
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
                    widget2: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => ColorDialog());
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
                  ),
                ],
              ),
            );
          },
        ))
      ],
    );
  }
}
