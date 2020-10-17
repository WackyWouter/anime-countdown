import 'package:flutter/cupertino.dart';

class Anime {
  final int id;
  final int idMal;
  final String startDate;
  final String endDate;
  final String title;
  final String status;
  final int episodes;
  final List<String> studios;
  final String coverImage;
  final String bannerImage;
  final List<String> synonyms;
  final String genre;
  final int averageScore;
  final int popularity;
  final String description;
  final List<Map<String, int>> airingSchedule;
  final int nextEpisode;
  bool favourite = false;

  Anime(
      {@required this.id,
      @required this.idMal,
      this.startDate,
      this.endDate,
      this.title,
      this.status,
      this.studios,
      this.episodes,
      this.coverImage,
      this.bannerImage,
      this.synonyms,
      this.genre,
      this.averageScore,
      this.popularity,
      this.description,
      this.airingSchedule,
      this.nextEpisode});

  void toggleFav() {
    favourite = !favourite;
  }

  int getTimeTillNextEpisode() {
//    Todo actually make this look for next episode
    return 31888;
  }
}
