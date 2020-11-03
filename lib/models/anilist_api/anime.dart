import 'package:animecountdown/models/anilist_api/episode.dart';
import 'package:animecountdown/models/anilist_api/studio_list.dart';
import 'package:animecountdown/models/anilist_api/title.dart';
import 'package:animecountdown/models/anilist_api/airing_schedule.dart';

class Anime {
  int id;
  int idMal;
  StudioList studios;
  Title title;
  String status;
  int episodes;
  String coverImage;
  String bannerImage;
  String season;
  int seasonYear;
  List<String> synonyms;
  int averageScore;
  int popularity;
  String description;
  String startDate;
  String endDate;
  AiringSchedule airingSchedule;
  Episode nextAiringEpisode;
  bool favourite = false;

  Anime(
      {this.id,
      this.idMal,
      this.studios,
      this.title,
      this.status,
      this.episodes,
      this.coverImage,
      this.bannerImage,
      this.season,
      this.seasonYear,
      this.synonyms,
      this.averageScore,
      this.popularity,
      this.description,
      this.startDate,
      this.endDate,
      this.airingSchedule,
      this.nextAiringEpisode});

  void toggleFav() {
    favourite = !favourite;
  }

  Anime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idMal = json['idMal'];
    studios = json['studios'] != null
        ? new StudioList.fromJson(json['studios'])
        : null;
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    status = json['status'];
    episodes = json['episodes'] ?? 0;
    coverImage = json['coverImage']['medium'] != null
        ? json['coverImage']['large']
        : 'https://redditreads.com/static/img/covers/9780679742753.jpg';
    bannerImage = json['bannerImage'];
    synonyms = json['synonyms'].cast<String>() ?? [];
    season = json['season'];
    seasonYear = json['seasonYear'];
    averageScore = json['averageScore'];
    popularity = json['popularity'];
    description = json['description'];
    if (json['startDate']['day'] != null &&
        json['startDate']['month'] != null &&
        json['startDate']['year'] != null) {
      startDate = json['startDate']['day'].toString() +
          '-' +
          json['startDate']['month'].toString() +
          '-' +
          json['startDate']['year'].toString();
    } else {
      startDate = '';
    }
    if (json['endDate']['day'] != null &&
        json['endDate']['month'] != null &&
        json['endDate']['year'] != null) {
      endDate = json['endDate']['day'].toString() +
          '-' +
          json['endDate']['month'].toString() +
          '-' +
          json['endDate']['year'].toString();
    } else {
      endDate = '';
    }
    airingSchedule = json['airingSchedule'] != null
        ? new AiringSchedule.fromJson(json['airingSchedule'])
        : null;
    nextAiringEpisode = json['nextAiringEpisode'] != null
        ? new Episode.fromJson(json['nextAiringEpisode'])
        : null;
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['idMal'] = this.idMal;
//    if (this.studios != null) {
//      data['studios'] = this.studios.toJson();
//    }
//    if (this.title != null) {
//      data['title'] = this.title.toJson();
//    }
//    data['status'] = this.status;
//    data['episodes'] = this.episodes;
//    if (this.coverImage != null) {
//      data['coverImage'] = this.coverImage.toJson();
//    }
//    data['bannerImage'] = this.bannerImage;
//    if (this.synonyms != null) {
//      data['synonyms'] = this.synonyms.map((v) => v.toJson()).toList();
//    }
//    data['averageScore'] = this.averageScore;
//    data['popularity'] = this.popularity;
//    data['description'] = this.description;
//    if (this.startDate != null) {
//      data['startDate'] = this.startDate.toJson();
//    }
//    if (this.endDate != null) {
//      data['endDate'] = this.endDate.toJson();
//    }
//    if (this.airingSchedule != null) {
//      data['airingSchedule'] = this.airingSchedule.toJson();
//    }
//    if (this.nextAiringEpisode != null) {
//      data['nextAiringEpisode'] = this.nextAiringEpisode.toJson();
//    }
//    return data;
//  }
}
