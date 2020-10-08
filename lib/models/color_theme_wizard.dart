import 'package:flutter/material.dart';
import 'package:animecountdown/models/color_theme.dart';

class ColorThemeWizard {
  List<ColorTheme> _colorThemes = [
    ColorTheme(
      name: 'redDark',
      loginBackground: AssetImage("assets/images/login_screen_red_dark.png"),
      primaryColor: Color(0xFFE42535),
      secondaryColor: Color(0xFFB61624),
      darkColor: Color(0xFF7F1019),
      backgroundColor: Color(0xFF020304),
      cardColor: Color(0xFF444444),
      loginBoxColor: Color(0xFF39424F),
    )
  ];
  bool darkMode;
  String colorName;
}
