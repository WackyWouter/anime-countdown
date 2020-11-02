import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'https://graphql.anilist.co/'),
  ),
);

final String testQuery = """
query{
  Page (page: 1, perPage: 1) {
    pageInfo {
      total
      currentPage
      lastPage
      hasNextPage
      perPage
    }
    media(status:RELEASING){
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
