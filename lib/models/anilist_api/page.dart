import 'package:animecountdown/models/anilist_api/page_info.dart';
import 'package:animecountdown/models/anilist_api/anime.dart';

class Page {
  PageInfo pageInfo;
  List<Anime> anime;

  Page({this.pageInfo, this.anime});

  Page.fromJson(Map<String, dynamic> json) {
    pageInfo = json['pageInfo'] != null
        ? new PageInfo.fromJson(json['pageInfo'])
        : null;
    if (json['media'] != null) {
      anime = new List<Anime>();
      json['media'].forEach((v) {
        anime.add(new Anime.fromJson(v));
      });
    }
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.pageInfo != null) {
//      data['pageInfo'] = this.pageInfo.toJson();
//    }
//    if (this.anime != null) {
//      data['media'] = this.anime.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
}
