import 'package:animecountdown/models/anime_data.dart';
import 'package:flutter/material.dart';
import 'package:animecountdown/anilist_api.dart' as AnilistApi;
import 'package:animecountdown/models/anilist_api/anilist_result.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/card_list.dart';

//https://blog.joshuadeguzman.net/integrating-graphql-in-flutter
//https://medium.com/better-programming/how-to-use-graphql-in-flutter-7decd04a511f

class GraphqlTest extends StatefulWidget {
  static const String id = 'grapqhl_test';
  @override
  _GraphqlTestState createState() => _GraphqlTestState();
}

class _GraphqlTestState extends State<GraphqlTest> {
  @override
  Widget build(BuildContext context) {
//    return Query(
//        options: QueryOptions(
//            documentNode: gql(
//          AnilistApi.testQuery,
//        )),
//        builder: (
//          QueryResult result, {
//          VoidCallback refetch,
//          FetchMore fetchMore,
//        }) {
//          if (result.loading) {
//            return Container(
//              child: Center(
//                child: Text("Loading"),
//              ),
//            );
//          }
//
//          AnilistResult response = AnilistResult.fromJson(result.data);
//
//          if (response == null) {
//            return Container(
//              child: Center(
//                child: Text("No items found"),
//              ),
//            );
//          } else {
//            return Column(
//              children: [
//                Expanded(
//                  child: Consumer2<ColorThemeWizard, AnimeData>(
//                      builder: (context, themeWizard, animeData, child) {
//                    AnilistApi.queryAnilist(AnilistApi.animeQuery);
//                    return Container(
//                      color: themeWizard.getBackgroundColor(),
//                      child: CardList(
//                        fav: false,
//                        type: "trending",
//                      ),
//                    );
//                  }),
//                ),
//              ],
//            );
//          }
//        });
  }
}
