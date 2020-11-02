class PageInfo {
  int total;
  int currentPage;
  int lastPage;
  bool hasNextPage;
  int perPage;

  PageInfo(
      {this.total,
      this.currentPage,
      this.lastPage,
      this.hasNextPage,
      this.perPage});

  PageInfo.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    hasNextPage = json['hasNextPage'];
    perPage = json['perPage'];
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['total'] = this.total;
//    data['currentPage'] = this.currentPage;
//    data['lastPage'] = this.lastPage;
//    data['hasNextPage'] = this.hasNextPage;
//    data['perPage'] = this.perPage;
//    return data;
//  }
}
