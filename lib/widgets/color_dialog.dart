import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/color_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> colors = ColorThemeWizard().getAvailableColors();
    return Consumer<ColorThemeWizard>(
      builder: (context, themeWizard, child) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 300.0,
            width: 200.0,
            child: Container(
              color: themeWizard.getCardColor(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ColorDialogButton(
                      text: colors[0],
                      onPressed: () {
                        themeWizard.changeColor(colors[0]);
                        Navigator.of(context).pop();
                      },
                      btnColor: themeWizard.getPrimaryColorByName(colors[0]),
                    ),
                    ColorDialogButton(
                      text: colors[1],
                      onPressed: () {
                        themeWizard.changeColor(colors[1]);
                        Navigator.of(context).pop();
                      },
                      btnColor: themeWizard.getPrimaryColorByName(colors[1]),
                    ),
                    ColorDialogButton(
                      text: colors[2],
                      onPressed: () {
                        themeWizard.changeColor(colors[2]);
                        Navigator.of(context).pop();
                      },
                      btnColor: themeWizard.getPrimaryColorByName(colors[2]),
                    ),
                    ColorDialogButton(
                      text: colors[3],
                      onPressed: () {
                        themeWizard.changeColor(colors[3]);
                        Navigator.of(context).pop();
                      },
                      btnColor: themeWizard.getPrimaryColorByName(colors[3]),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
