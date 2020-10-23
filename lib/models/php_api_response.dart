import 'package:animecountdown/models/token.dart';

class PhpApiResponse {
  final String status;
  final String error;
  final Token token;
  final List<int> animeList;

  PhpApiResponse({this.status, this.error, this.token, this.animeList});

  factory PhpApiResponse.fromJson(Map<String, dynamic> json) {
    return PhpApiResponse(
        status: json['status'],
        error: json.containsKey('error') ? json['error'] : null,
        token: json.containsKey('token') ? Token.fromJson(json['token']) : null,
        animeList: json.containsKey('animeList') ? json['animeList'] : null);
  }
}
