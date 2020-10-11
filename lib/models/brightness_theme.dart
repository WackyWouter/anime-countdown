import 'package:flutter/material.dart';

class BrightnessTheme {
  final String name;
  final Color backgroundColor;
  final Color cardColor;
  final Color loginBoxColor;
  final Color iconColor;
  final Color cardTextColor;
  final Map<String, AssetImage> backgrounds;

  BrightnessTheme(
      {this.name,
      this.loginBoxColor,
      this.iconColor,
      this.cardColor,
      this.backgroundColor,
      this.backgrounds,
      this.cardTextColor});
}
