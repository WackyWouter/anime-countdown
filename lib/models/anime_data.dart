import 'dart:collection';

import 'package:animecountdown/models/anime.dart';
import 'package:flutter/foundation.dart';

class AnimeData extends ChangeNotifier {
  List<Anime> _animeList = [
    Anime(
      id: 1,
      idMal: 1,
      title: 'Death Note1',
//    large
      coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/nx21-tXMN3Y20PIL9.jpg',
      studios: ['MADHOUSE', 'VAP', 'Viz Media'],
      averageScore: 84,
    ),
    Anime(
      id: 2,
      idMal: 2,
      title: 'Death Note2',
      //    large
      coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/nx21-tXMN3Y20PIL9.jpg',
      studios: ['MADHOUSE', 'VAP', 'Viz Media'],
      averageScore: 84,
    ),
    Anime(
      id: 3,
      idMal: 3,
      title: 'Death Note3',
      //    medium
      coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx1535-dHQBB5zeDphY.png',
      studios: ['MADHOUSE', 'VAP', 'Viz Media'],
      averageScore: 84,
    ),
    Anime(
      id: 4,
      idMal: 4,
      title: 'Death Note4',
      //    medium TODO make sure to use large
      coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx1535-dHQBB5zeDphY.png',
      studios: ['MADHOUSE', 'VAP', 'Viz Media'],
      averageScore: 84,
    ),
  ];

  List<int> _favList = [];
  List<Anime> _favAnimeList = [];

  UnmodifiableListView<Anime> get animeList {
    return UnmodifiableListView(_animeList);
  }

  UnmodifiableListView<int> get favList {
    return UnmodifiableListView(_favList);
  }

  UnmodifiableListView<Anime> get favAnimeList {
    return UnmodifiableListView(_favAnimeList);
  }

  int get animeCount {
    return _animeList.length;
  }

  int get favCount {
    return _favList.length;
  }

  int get favAnimeCount {
    return _favAnimeList.length;
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
    if (_favList.contains(anime.id)) {
//      todo remove from db
      _favList.remove(anime.id);
      _favAnimeList.removeWhere((element) => element.id == anime.id);
      anime.toggleFav();
      notifyListeners();
    } else if (!_favList.contains(anime.id)) {
//      todo  add to db
//    todo order list
      _favList.add(anime.id);
      _favAnimeList.add(anime);
      anime.toggleFav();
      notifyListeners();
    }
  }

  void populateFavList() {
    //    todo get all the anime in the favidlist;
  }

  Anime getAnimeById(int id) {
    _animeList.forEach((anime) {
      if (anime.id == id) {
        return anime;
      }
    });
//    todo query the api with the id
  }
}
