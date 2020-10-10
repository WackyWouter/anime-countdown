import 'package:flutter/material.dart';

class BrightnessTheme {
  final String name;
  final Color backgroundColor;
  final Color cardColor;
  final Color loginBoxColor;
  final Map<String, AssetImage> backgrounds;

  BrightnessTheme(
      {this.name,
      this.loginBoxColor,
      this.cardColor,
      this.backgroundColor,
      this.backgrounds});
}
