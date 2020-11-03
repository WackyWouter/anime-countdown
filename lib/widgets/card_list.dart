import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/anime_card.dart';
import 'package:animecountdown/widgets/thin_outline_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/anilist_api/anime.dart';
import 'package:animecountdown/anilist_api.dart' as AnilistApi;

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ColorThemeWizard, AnimeData>(
        builder: (context, themeWizard, animeData, child) {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 30, top: 10),
        itemBuilder: (context, index) {
          Anime anime = animeData.animeList[index];
          print(animeData.animeCount + 1);
          print(index);

//          TODO make this button appear
          if (index == animeData.animeList.length &&
              animeData.animePage.hasNextPage) {
            print("btn");
            return ThinOutlineBtn(
              primaryColor: themeWizard.getPrimaryColor(),
              darkColor: themeWizard.getBackgroundColor(),
              text: "More",
              highlightedBorderColor: themeWizard.getPrimaryColor(),
              ontap: () {
                AnilistApi.followUpQuery(AnilistApi.animeQuery, animeData,
                    animeData.animePage.currentPage + 1);
              },
            );
          }

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
        itemCount: animeData.animeCount == 0
            ? animeData.animeCount
            : animeData.animeCount + 1,
      );
    });
  }
}
