import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';

class SettingsRow extends StatelessWidget {
  final IconData icon;
  final Widget button;
  final String text;

  SettingsRow({@required this.icon, @required this.text, this.button});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorThemeWizard>(builder: (context, themeWizard, child) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color: themeWizard.getPrimaryColor(),
                    size: 30,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: themeWizard.getCardTextColor(), fontSize: 20.0),
                ),
              ],
            ),
            button ?? null,
          ]);
    });
  }
}
