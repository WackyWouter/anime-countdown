import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/widgets/card_list.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/models/php_api.dart';
import 'package:animecountdown/anilist_api.dart' as AnilistApi;

//TODO add something to handle if a timeout happens bcs to many requests
class TrendingAnimeScreen extends StatefulWidget {
  static const String id = 'trending_anime_screen';

  @override
  _TrendingAnimeScreenState createState() => _TrendingAnimeScreenState();
}

class _TrendingAnimeScreenState extends State<TrendingAnimeScreen> {
  bool showSearchField = false;
  String search;
  String searchController = '';
  @override
  Widget build(BuildContext context) {
    PhpApi.checkToken();
    return Consumer2<ColorThemeWizard, AnimeData>(
        builder: (context, themeWizard, animeData, child) {
      return Column(
        children: <Widget>[
          TitleBar(
            widgetLeft: GestureDetector(
              onTap: () {
//                TODO open filter menu
              },
              child: FaIcon(
                FontAwesomeIcons.filter,
                size: 25,
                color: Colors.white,
              ),
            ),
            title: "TRENDING",
            searchWidget: showSearchField
                ? Container(
                    width: 250,
                    child: TextField(
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          searchController = value;
                        },
                        style: TextStyle(
                            color: Colors.white, fontSize: 20, height: 1.5)),
                  )
                : null,
            widgetRight: GestureDetector(
              onTap: () {
                if (!showSearchField) {
                  setState(() {
                    showSearchField = true;
                  });
                } else {
                  setState(() {
                    search = searchController;
                    searchController = '';
                    showSearchField = false;
                  });
                  AnilistApi.fetchedData = false;
                }
              },
              child: FaIcon(
                FontAwesomeIcons.search,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: themeWizard.getBackgroundColor(),
            child: CardList(
              search: search,
            ),
          )),
        ],
      );
    });
  }
}
