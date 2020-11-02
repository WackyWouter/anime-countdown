class Episode {
  int timeUntilAiring;
  int episodeId;
  int episodeNumber;
  int airingAt;

  Episode(
      {this.timeUntilAiring,
      this.episodeId,
      this.episodeNumber,
      this.airingAt});

  Episode.fromJson(Map<String, dynamic> json) {
    timeUntilAiring = json['timeUntilAiring'];
    episodeId = json['id'];
    episodeNumber = json['episode'];
    airingAt = json['aringAt'];
  }

//	Map<String, dynamic> toJson() {
//		final Map<String, dynamic> data = new Map<String, dynamic>();
//		data['timeUntilAiring'] = this.timeUntilAiring;
//		return data;
//	}
}
