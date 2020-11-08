import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/anime_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/anilist_api/anime.dart';

class FavCardList extends StatefulWidget {
  @override
  _FavCardListState createState() => _FavCardListState();
}

class _FavCardListState extends State<FavCardList> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ColorThemeWizard, AnimeData>(
        builder: (context, themeWizard, animeData, child) {
//          TODO add loading icon

      return ListView.builder(
        padding: EdgeInsets.only(bottom: 30, top: 10),
        itemBuilder: (context, index) {
          Anime anime = animeData.favAnimeList[index];
          return AnimeCard(
            anime: anime,
            darkMode: themeWizard.getCurrentMode(),
            activeIcon: themeWizard.getPrimaryColor(),
            background: themeWizard.getCardColor(),
            btnHighlightColor: themeWizard.getBackgroundColor(),
            textColor: themeWizard.getCardTextColor(),
            inActiveIcon: themeWizard.getIconColor(),
          );
        },
        itemCount: animeData.favIdCount,
      );
    });
  }
}
