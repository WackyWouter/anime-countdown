import 'package:animecountdown/models/anilist_api/studio.dart';

class StudioList {
  List<Studio> studio;

  StudioList({this.studio});

  StudioList.fromJson(Map<String, dynamic> json) {
    if (json['nodes'] != null) {
      studio = new List<Studio>();
      json['nodes'].forEach((v) {
        studio.add(new Studio.fromJson(v));
      });
    }
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.studio != null) {
//      data['nodes'] = this.studio.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
}
