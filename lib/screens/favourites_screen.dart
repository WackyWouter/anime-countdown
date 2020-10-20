import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/widgets/card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/title_bar.dart';

class FavouritesScreen extends StatelessWidget {
  static const String id = 'favourites_screen';
  @override
  Widget build(BuildContext context) {
    print("favourite");
    return Consumer2<ColorThemeWizard, AnimeData>(
        builder: (context, themeWizard, animeData, child) {
      return Column(
        children: <Widget>[
          TitleBar(
            title: 'FAVOURITE ANIME',
          ),
          Expanded(
            child: Container(
              color: themeWizard.getBackgroundColor(),
              child: CardList(
                fav: true,
              ),
            ),
          ),
        ],
      );
    });
  }
}
