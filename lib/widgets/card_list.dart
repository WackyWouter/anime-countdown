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
      List<Anime> animeList = animeData.animeList;
      print(animeList.length);
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 30, top: 10),
        itemBuilder: (context, index) {
          if (index == animeList.length) {
            return Container(
              alignment: Alignment.center,
              child: ThinOutlineBtn(
                primaryColor: themeWizard.getPrimaryColor(),
                darkColor: themeWizard.getBackgroundColor(),
                text: "More",
                specificPadding: EdgeInsets.fromLTRB(150, 0, 150, 0),
                width: 3,
                highlightedBorderColor: themeWizard.getPrimaryColor(),
                ontap: () {
                  if (animeData.animePage != null &&
                      animeData.animePage.hasNextPage) {
                    AnilistApi.followUpQuery(AnilistApi.animeQuery, animeData,
                        animeData.animePage.currentPage + 1);
                  } else {
//                    TODO use this link to create snackbar https://pub.dev/packages/flushbar
                  }
                },
              ),
            );
          }
          Anime anime = animeList[index];

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
        itemCount: animeList.length + 1,
      );
    });
  }
}
