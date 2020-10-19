import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/constant.dart';

class SettingsCard extends StatelessWidget {
  final double height;
  final String heading;
  final Widget widget1;
  final Widget widget2;
  SettingsCard(
      {this.height, this.heading, @required this.widget1, this.widget2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<ColorThemeWizard>(
        builder: (context, themeWizard, child) {
          return Container(
            height: height ?? 180,
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    heading ?? '',
                    style: TextStyle(
                        color: themeWizard.getCardTextColor(), fontSize: 23.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  widget1,
                  widget2 != null
                      ? Divider(
                          height: 10.0,
                          thickness: 2.0,
                          color: kGreyAccent,
                          indent: 45,
                          endIndent: 20,
                        )
                      : const SizedBox(),
                  widget2 ?? const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
