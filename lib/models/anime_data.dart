import 'dart:collection';

import 'package:animecountdown/models/anime.dart';
import 'package:flutter/foundation.dart';

class AnimeData extends ChangeNotifier {
  List<Anime> _animeList = [
    Anime(
      id: 1,
      idMal: 1,
      title: 'Death Note',
//    large
      coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/nx21-tXMN3Y20PIL9.jpg',
      studios: ['MADHOUSE', 'VAP', 'Viz Media'],
      averageScore: 84,
    ),
    Anime(
      id: 1,
      idMal: 1,
      title: 'Death Note',
      //    large
      coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/nx21-tXMN3Y20PIL9.jpg',
      studios: ['MADHOUSE', 'VAP', 'Viz Media'],
      averageScore: 84,
    ),
    Anime(
      id: 1,
      idMal: 1,
      title: 'Death Note',
      //    medium
      coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx1535-dHQBB5zeDphY.png',
      studios: ['MADHOUSE', 'VAP', 'Viz Media'],
      averageScore: 84,
    ),
    Anime(
      id: 1,
      idMal: 1,
      title: 'Death Note',
      //    medium TODO make sure to use large
      coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx1535-dHQBB5zeDphY.png',
      studios: ['MADHOUSE', 'VAP', 'Viz Media'],
      averageScore: 84,
    ),
  ];

  UnmodifiableListView<Anime> get animeList {
    return UnmodifiableListView(_animeList);
  }

  int get animeCount {
    return _animeList.length;
  }

  void addAnime(
      {@required int id,
      @required int idmal,
      String startDate,
      String endDate,
      String title,
      String status,
      int episodes,
      List<String> studios,
      String coverImage,
      String bannerImage,
      List<String> synonyms,
      String genre,
      int averageScore,
      int popularity,
      String description,
      List<Map<String, int>> airingSchedule,
      int nextEpisode}) {
    _animeList.add(Anime(
        id: id,
        idMal: idmal,
        startDate: startDate,
        endDate: endDate,
        title: title,
        studios: studios,
        status: status,
        episodes: episodes,
        coverImage: coverImage,
        bannerImage: bannerImage,
        synonyms: synonyms,
        genre: genre,
        averageScore: averageScore,
        popularity: popularity,
        description: description,
        airingSchedule: airingSchedule,
        nextEpisode: nextEpisode));
    notifyListeners();
  }

  void favourite(Anime anime) {
    anime.toggleFav();
//		TODO add it to the db;
    notifyListeners();
  }
}
