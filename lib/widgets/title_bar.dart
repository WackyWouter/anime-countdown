import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final Widget widgetLeft;
  final Widget widgetRight;

  TitleBar({this.title, this.widgetLeft, this.widgetRight});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorThemeWizard>(
      builder: (context, themeWizard, child) {
        return Column(
          children: [
            Container(
              color: themeWizard.getPrimaryColor(),
              width: double.infinity,
              height: 120.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    widgetLeft ?? SizedBox(),
                    Text(
                      title ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    widgetRight ?? SizedBox(),
                  ],
                ),
              ),
            ),
            Container(
              color: themeWizard.getSecondaryColor(),
              width: double.infinity,
              height: 20.0,
            ),
          ],
        );
      },
    );
  }
}
