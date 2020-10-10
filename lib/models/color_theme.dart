import 'package:flutter/material.dart';

class ColorTheme {
  final String name;
  final Color primaryColor;
  final Color secondaryColor;
  final Color darkColor;
  final bool darkMode;

  ColorTheme(
      {this.name,
      this.primaryColor,
      this.secondaryColor,
      this.darkColor,
      this.darkMode});
}
