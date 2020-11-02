import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:animecountdown/anilist_api.dart' as AnilistApi;
import 'package:animecountdown/models/anilist_api/anilist_result.dart';

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
    return Query(
        options: QueryOptions(
            documentNode: gql(
          AnilistApi.testQuery,
        )),
        builder: (
          QueryResult result, {
          VoidCallback refetch,
          FetchMore fetchMore,
        }) {
          if (result.loading) {
            return Container(
              child: Center(
                child: Text("Loading"),
              ),
            );
          }

          AnilistResult response = AnilistResult.fromJson(result.data);

          if (response == null) {
            return Container(
              child: Center(
                child: Text("No items found"),
              ),
            );
          } else {
            print(response.page.anime[0].startDate);
            return Text("test succesfull");
          }
        });
  }
}
