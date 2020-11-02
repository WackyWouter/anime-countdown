import 'package:animecountdown/models/anilist_api/page.dart';

class AnilistResult {
  Page page;

  AnilistResult({this.page});

  AnilistResult.fromJson(Map<String, dynamic> json) {
    page = json['Page'] != null ? new Page.fromJson(json['Page']) : null;
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.page != null) {
//      data['Page'] = this.page.toJson();
//    }
//    return data;
//  }
}
