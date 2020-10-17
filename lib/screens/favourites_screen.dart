import 'package:animecountdown/widgets/card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/title_bar.dart';

class FavouritesScreen extends StatefulWidget {
  static const String id = 'favourites_screen';
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorThemeWizard>(builder: (context, themeWizard, child) {
      return Column(
        children: <Widget>[
          TitleBar(
            title: 'FAVOURITE ANIME',
          ),
          Expanded(
            child: Container(
              color: themeWizard.getBackgroundColor(),
              child: CardList(),
            ),
          ),
        ],
      );
    });
  }
}
