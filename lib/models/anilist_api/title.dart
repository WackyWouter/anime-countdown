class Title {
  String english;
  String romaji;
  String native;

  Title({this.english, this.romaji, this.native});

  Title.fromJson(Map<String, dynamic> json) {
    english = json['english'];
    romaji = json['romaji'];
    native = json['native'];
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['english'] = this.english;
//    data['romaji'] = this.romaji;
//    data['native'] = this.native;
//    return data;
//  }
}
