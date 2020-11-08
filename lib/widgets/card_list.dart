import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/anime_card.dart';
import 'package:animecountdown/widgets/loading.dart';
import 'package:animecountdown/widgets/thin_outline_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/anilist_api/anime.dart';
import 'package:animecountdown/anilist_api.dart' as AnilistApi;
import 'package:flushbar/flushbar.dart';

class CardList extends StatefulWidget {
  final String search;

  CardList({this.search});

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  Flushbar flush;
  bool inProgress = true;
  int lengthOld = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer2<ColorThemeWizard, AnimeData>(
        builder: (context, themeWizard, animeData, child) {
//          TODO add loading icon when searching with search

      AnilistApi.queryAnilist(animeData: animeData, search: widget.search);
      List<Anime> animeList = animeData.animeList;
      if ((animeList.length > lengthOld)) {
        inProgress = false;
        lengthOld = animeList.length;

        if (animeData.favIdCount == 0) {
          animeData.checkFavlist();
        }
      }
      return Loading(
        inProgress: inProgress,
        iconColor: themeWizard.getPrimaryColor(),
        child: ListView.builder(
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
                      AnilistApi.queryAnilist(
                          animeData: animeData,
                          page: animeData.animePage.currentPage + 1,
                          search: widget.search);
                      setState(() {
                        inProgress = true;
                      });
                    } else {
                      flush = Flushbar<bool>(
                        flushbarPosition: FlushbarPosition.TOP,
                        flushbarStyle: FlushbarStyle.GROUNDED,
                        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                        message: "No additional results could be found",
                        leftBarIndicatorColor: themeWizard.getPrimaryColor(),
                        icon: Icon(
                          Icons.error,
                          color: themeWizard.getPrimaryColor(),
                        ),
                        isDismissible: true,
                        duration: Duration(seconds: 4),
                      )..show(context);
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
        ),
      );
    });
  }
}
