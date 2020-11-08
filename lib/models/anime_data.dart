import 'dart:collection';
import 'package:animecountdown/models/anilist_api/anilist_result.dart';
import 'package:flutter/foundation.dart';
import 'package:animecountdown/models/anilist_api/anime.dart';
import 'package:animecountdown/models/anilist_api/page_info.dart';
import 'package:animecountdown/models/php_api.dart';
import 'package:animecountdown/anilist_api.dart' as AnilistApi;

class AnimeData extends ChangeNotifier {
  List<Anime> _animeList = [];
  List<int> _favIdList = [];
  List<Anime> _favAnimeList = [];
  PageInfo _animePage;
  PageInfo _favPage;

  UnmodifiableListView<Anime> get animeList {
    return UnmodifiableListView(_animeList);
  }

  UnmodifiableListView<int> get favList {
    return UnmodifiableListView(_favIdList);
  }

  UnmodifiableListView<Anime> get favAnimeList {
    return UnmodifiableListView(_favAnimeList);
  }

  PageInfo get favPage {
    return _favPage;
  }

  void addFavPage(PageInfo favPage) {
    _favPage = favPage;
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

  void checkFavlist() async {
    print('checkFavList');
    List<int> dbAnimeIds = await PhpApi.getFavIdList();
    if (listEquals(dbAnimeIds, _favIdList)) {
//      don't need to do anything
    } else {
      _favIdList = dbAnimeIds;
//    TODO favourite the ones in so
      dbAnimeIds.forEach((element) {
        _animeList.forEach((anime) {
          if (element == anime.id) {
//            toggle favourite the anime
            anime.favourite = true;
          }
        });
      });

      AnilistResult result = await AnilistApi.queryFavAnilist(ids: dbAnimeIds);
      if (result != null) {
        addFavPage(result.page.pageInfo);
        populateFavList(result.page.anime);
      }
    }
  }

  void populateFavList(List<Anime> favList) {
    favList.forEach((element) {
      element.favourite = true;
    });
    _favAnimeList = favList;
    sortAnimeList();
    notifyListeners();
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
    //      TODO sort the list based on when next episode is
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
//    Remove anime
    if (_favIdList.contains(anime.id)) {
      PhpApi.favouriteDB(id: anime.id, remove: true);
      _favIdList.remove(anime.id);
      _favAnimeList.removeWhere((element) => element.id == anime.id);

//     Need to do this cause there can be a sepperate instance of the same anime in favlist and otherwise the main list doesnt get updated
      Anime mainListAnime = _animeList
          .singleWhere((element) => element.id == anime.id, orElse: () => null);
      if (mainListAnime != null) {
        mainListAnime.favourite = false;
      }

      anime.favourite = false;
      notifyListeners();
    }
//    Add anime
//    TODO give messege that you can only favourite max 50
    else if (!_favIdList.contains(anime.id) && favIdCount < 50) {
      PhpApi.favouriteDB(id: anime.id);
//    todo order list
      _favIdList.add(anime.id);
      _favAnimeList.add(anime);
      anime.favourite = true;
      notifyListeners();
    }
  }
}
