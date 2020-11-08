import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final Widget widgetLeft;
  final Widget widgetRight;
  final Widget searchWidget;

  TitleBar({this.title, this.widgetLeft, this.widgetRight, this.searchWidget});

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    widgetLeft != null
                        ? Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: widgetLeft,
                          )
                        : SizedBox(),
                    searchWidget == null
                        ? Text(
                            title ?? '',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )
                        : searchWidget,
                    widgetRight != null
                        ? Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: widgetRight,
                          )
                        : SizedBox(),
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
