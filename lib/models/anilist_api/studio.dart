class Studio {
  String name;
  bool isAnimationStudio;

  Studio({this.name, this.isAnimationStudio});

  Studio.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isAnimationStudio = json['isAnimationStudio'];
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['name'] = this.name;
//    data['isAnimationStudio'] = this.isAnimationStudio;
//    return data;
//  }
}
