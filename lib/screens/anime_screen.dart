import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/models/anime_data.dart';

class AnimeScreen extends StatefulWidget {
  static const String id = 'anime_screen';
  final int animeId;
  AnimeScreen({@required this.animeId});

  @override
  _AnimeScreenState createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {
  AnimeData animeData = AnimeData();
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorThemeWizard>(builder: (context, themeWizard, child) {
      return Column(
        children: <Widget>[],
      );
    });
  }
}
