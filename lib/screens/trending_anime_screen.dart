import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/widgets/card_list.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/models/php_api.dart';
import 'package:graphql/client.dart';
import 'package:animecountdown/anilist_api.dart' as AnilistApi;
import 'package:animecountdown/models/anilist_api/anilist_result.dart';
import 'package:animecountdown/widgets/thin_outline_btn.dart';

//TODO add something to handle if a timeout happens bcs to many requests
class TrendingAnimeScreen extends StatelessWidget {
  static const String id = 'trending_anime_screen';
  @override
  Widget build(BuildContext context) {
    PhpApi.checkToken();
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
          widgetRight: GestureDetector(
            onTap: () {
//                TODO open search menu
            },
            child: FaIcon(
              FontAwesomeIcons.search,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Consumer2<ColorThemeWizard, AnimeData>(
              builder: (context, themeWizard, animeData, child) {
            AnilistApi.initialQueryAnilist(AnilistApi.animeQuery, animeData);
//            TODO add load icon
            return Container(
              color: themeWizard.getBackgroundColor(),
              child: CardList(),
            );
          }),
        ),
      ],
    );
  }
}

//Expanded(
//child: Consumer2<ColorThemeWizard, AnimeData>(
//builder: (context, themeWizard, animeData, child) {
//return Container(
//color: themeWizard.getBackgroundColor(),
//child: Query(
//options:
//QueryOptions(documentNode: gql(AnilistApi.testQuery)),
//builder: (
//QueryResult result, {
//VoidCallback refetch,
//FetchMore fetchMore,
//}) {
//if (result.loading) {
////                  TODO show loading wheel
//return Container(
//child: Center(
//child: Text("Loading"),
//),
//);
//}
//
//AnilistResult response =
//AnilistResult.fromJson(result.data);
//
//if (response == null) {
//return Container(
//child: Center(
//child: Text("No anime found"),
//),
//);
//} else {
//animeData.replaceAnimeList(response.page.anime);
//return CardList(
//fav: false,
//type: "trending",
//);
//}
//}),
//);
//}),
//),
