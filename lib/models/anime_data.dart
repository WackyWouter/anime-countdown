import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:animecountdown/models/anilist_api/anime.dart';
import 'package:animecountdown/models/anilist_api/page_info.dart';

class AnimeData extends ChangeNotifier {
  List<Anime> _animeList = [];
  List<int> _favIdList = [];
  List<Anime> _favAnimeList = [];
  PageInfo _animePage;

  UnmodifiableListView<Anime> get animeList {
    return UnmodifiableListView(_animeList);
  }

  UnmodifiableListView<int> get favList {
    return UnmodifiableListView(_favIdList);
  }

  UnmodifiableListView<Anime> get favAnimeList {
    return UnmodifiableListView(_favAnimeList);
  }

  PageInfo get animePage {
    return _animePage;
  }

  void addAnimePage(PageInfo animePage) {
    _animePage = animePage;
  }

  int get animeCount {
    return _animeList.length;
  }

  int get favIdCount {
    return _favIdList.length;
  }

  int get favAnimeCount {
    return _favAnimeList.length;
  }

  void addAnime(Anime anime) {
    bool duplicate = false;
    _animeList.forEach((element) {
      if (element.id == anime.id) {
        duplicate = true;
      }
    });
    if (!duplicate) {
      _animeList.add(anime);
      sortAnimeList();
      notifyListeners();
    }
  }

  void sortAnimeList() {
    //      TODO sort the list
  }

  void replaceAnimeList(List<Anime> animeList) {
    _animeList = animeList;
    notifyListeners();
  }

  void addAnimeList(List<Anime> animeList) {
    animeList.forEach((element) {
      addAnime(element);
    });
  }

  void removeAnime(Anime anime) {
    _animeList.removeWhere((element) => element.id == anime.id);
    notifyListeners();
  }

  void favourite(Anime anime) {
    print(anime.title.romaji);
//    Remove anime
    if (_favIdList.contains(anime.id)) {
//      todo remove from db
      _favIdList.remove(anime.id);
      _favAnimeList.removeWhere((element) => element.id == anime.id);
      anime.toggleFav();
      notifyListeners();
    }
//    Add anime
    else if (!_favIdList.contains(anime.id)) {
//      todo  add to db
//    todo order list
      _favIdList.add(anime.id);
      _favAnimeList.add(anime);
      anime.toggleFav();
      notifyListeners();
    }
  }
}

//  void populateFavList() {
//    //    todo get all the anime in the favidlist;
//  }
//
//  Anime getAnimeById(int id) {
//    _animeList.forEach((anime) {
//      if (anime.id == id) {
//        return anime;
//      }
//    });
////    todo query the api with the id
//  }
