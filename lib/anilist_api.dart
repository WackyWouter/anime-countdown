import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:flutter/material.dart';
import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/models/anilist_api/anilist_result.dart';

final GraphQLClient client = GraphQLClient(
  cache: InMemoryCache(),
  link: HttpLink(uri: 'https://graphql.anilist.co/'),
);

bool fetchedData = false;

void initialQueryAnilist(String query, AnimeData animeData) async {
  if (!fetchedData) {
    final QueryOptions options =
        QueryOptions(documentNode: gql(query), variables: <String, dynamic>{
      'nPage': 1,
    });

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
      throw (result.exception.toString());
    }
    AnilistResult response = AnilistResult.fromJson(result.data);
    print('initial');

    animeData.addAnimePage(response.page.pageInfo);
    animeData.replaceAnimeList(response.page.anime);
    fetchedData = true;
  }
}

void followUpQuery(String query, AnimeData animeData, int page) async {
  final QueryOptions options =
      QueryOptions(documentNode: gql(query), variables: <String, dynamic>{
    'nPage': page,
  });

  final QueryResult result = await client.query(options);

  if (result.hasException) {
    print(result.exception.toString());
    throw (result.exception.toString());
  }
  AnilistResult response = AnilistResult.fromJson(result.data);

  animeData.addAnimePage(response.page.pageInfo);
  animeData.addAnimeList(response.page.anime);
}

final String animeQuery = r"""
query AnimeQuery($nPage: Int!){
  Page (page: $nPage, perPage: 50) {
    pageInfo {
      total
      currentPage
      lastPage
      hasNextPage
      perPage
    }
    media(status:RELEASING,sort: POPULARITY_DESC){
      id
      idMal
      studios(isMain:true){
        nodes{
          name
          isAnimationStudio
        }
      }
      seasonYear
      season
      title {
        english
        romaji
        native
      }
      status
      episodes
      coverImage{
        medium
        large
      }
      bannerImage
      synonyms
      averageScore
      popularity
      description(asHtml: false)
      startDate{
        day
        month
        year
      }
      endDate{
        day
        month
        year
      }
      
      airingSchedule(page:6, perPage: 50){
        nodes{
          timeUntilAiring
          id
          episode
          airingAt
        }
        pageInfo {
          total
          perPage
          currentPage
          lastPage
          hasNextPage
        }
      }
      nextAiringEpisode {
        id
        timeUntilAiring
        airingAt
        episode
      }
    }
  }
}

""";
