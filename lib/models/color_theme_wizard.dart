import 'package:animecountdown/models/brightness_theme.dart';
import 'package:flutter/material.dart';
import 'package:animecountdown/models/color_theme.dart';

class ColorThemeWizard {
  Map<String, BrightnessTheme> _brightThemes = {
    'Dark Mode': BrightnessTheme(
      name: 'Dark Mode',
      backgroundColor: Color(0xFF020304),
      cardColor: Color(0xFF444444),
      loginBoxColor: Color(0xFF39424F),
      backgrounds: {
        "Red": AssetImage("assets/images/login_screen_red_dark.png"),
        "Blue": AssetImage("assets/images/login_screen_blue_dark.png"),
        "Purple": AssetImage("assets/images/login_screen_pink_dark.png"),
        "Turqoise": AssetImage("assets/images/login_screen_turqoise_dark.png"),
      },
    ),
    'Light Mode': BrightnessTheme(
      name: 'Light Mode',
      backgroundColor: Color(0xFFE5E5E5),
      cardColor: Color(0xFFFFFFFF),
      loginBoxColor: Color(0xFFEDEDED),
      backgrounds: {
        "Red": AssetImage("assets/images/login_screen_red_light.png"),
        "Blue": AssetImage("assets/images/login_screen_blue_light.png"),
        "Purple": AssetImage("assets/images/login_screen_pink_light.png"),
        "Turqoise": AssetImage("assets/images/login_screen_turqoise_light.png"),
      },
    ),
  };
  Map<String, ColorTheme> _colorThemes = {
    "Red": ColorTheme(
      name: 'Red',
      primaryColor: Color(0xFFE42535),
      secondaryColor: Color(0xFFB61624),
      darkColor: Color(0xFF7F1019),
    ),
    "Blue": ColorTheme(
      name: 'Blue',
      primaryColor: Color(0xFF2DE1FC),
      secondaryColor: Color(0xFF1FA2CD),
      darkColor: Color(0xFF11629C),
    ),
    "Purple": ColorTheme(
      name: 'Purple',
      primaryColor: Color(0xFFC24FE2),
      secondaryColor: Color(0xFF9241A3),
      darkColor: Color(0xFF613364),
    ),
    "Turqoise": ColorTheme(
      name: 'Turqoise',
      primaryColor: Color(0xFF4FE2C2),
      secondaryColor: Color(0xFF41A392),
      darkColor: Color(0xFF336461),
    ),
  };
  String _mode = "Dark Mode";
  String _colorName = "Purple";

  AssetImage getLoginBackground() {
    return _brightThemes[_mode].backgrounds[_colorName];
  }

  Color getBackgroundColor() {
    return _brightThemes[_mode].backgroundColor;
  }

  Color getCardColor() {
    return _brightThemes[_mode].cardColor;
  }

  Color getLoginBoxColor() {
    return _brightThemes[_mode].loginBoxColor;
  }

  Color getPrimaryColor() {
    return _colorThemes[_colorName].primaryColor;
  }

  Color getSecondaryColor() {
    return _colorThemes[_colorName].secondaryColor;
  }

  Color getDarkColor() {
    return _colorThemes[_colorName].darkColor;
  }

  List<String> getAvailableModes() {
    return _brightThemes.keys.toList();
  }

  List<String> getAvailableColors() {
    return _colorThemes.keys.toList();
  }

  int getColorCount() {
    return _colorThemes.length;
  }

  int getModeCount() {
    return _brightThemes.length;
  }

  void changeMode(String mode) {
    if (getAvailableModes().contains(mode)) {
      _mode = mode;
    }
  }

  void changeColor(String color) {
    if (getAvailableColors().contains(color)) {
      _colorName = color;
    }
  }
}
