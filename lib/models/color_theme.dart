import 'package:flutter/material.dart';

class ColorTheme {
  final String name;
  final AssetImage loginBackground;
  final Color primaryColor;
  final Color secondaryColor;
  final Color darkColor;
  final Color backgroundColor;
  final Color cardColor;
  final Color loginBoxColor;

  ColorTheme(
      {this.name,
      this.loginBackground,
      this.primaryColor,
      this.secondaryColor,
      this.darkColor,
      this.backgroundColor,
      this.cardColor,
      this.loginBoxColor});
}
