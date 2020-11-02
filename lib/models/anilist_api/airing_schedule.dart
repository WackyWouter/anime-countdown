import 'package:animecountdown/models/anilist_api/page_info.dart';
import 'package:animecountdown/models/anilist_api/episode.dart';

class AiringSchedule {
  List<Episode> episode;
  PageInfo pageInfo;

  AiringSchedule({this.episode, this.pageInfo});

  AiringSchedule.fromJson(Map<String, dynamic> json) {
    if (json['nodes'] != null) {
      episode = new List<Episode>();
      json['nodes'].forEach((v) {
        episode.add(new Episode.fromJson(v));
      });
    }
    pageInfo = json['pageInfo'] != null
        ? new PageInfo.fromJson(json['pageInfo'])
        : null;
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.nodes != null) {
//      data['nodes'] = this.nodes.map((v) => v.toJson()).toList();
//    }
//    if (this.pageInfo != null) {
//      data['pageInfo'] = this.pageInfo.toJson();
//    }
//    return data;
//  }
}
