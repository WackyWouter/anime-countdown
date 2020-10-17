import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/anime_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AnimeData animeData = AnimeData();
    return Consumer<ColorThemeWizard>(builder: (context, themeWizard, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final anime = animeData.animeList[index];
          return AnimeCard(
            title: anime.title,
            coverImage: anime.coverImage,
            isFavourite: anime.favourite,
            studio: 'test',
            score: anime.averageScore,
            nextEpisode: anime.getTimeTillNextEpisode(),
            activeIcon: themeWizard.getPrimaryColor(),
            inactiveIcon: themeWizard.getIconColor(),
            background: themeWizard.getCardColor(),
            textColor: themeWizard.getCardTextColor(),
          );
        },
        itemCount: animeData.animeCount,
      );
    });
  }
}
