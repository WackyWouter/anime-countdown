class Token {
  final String token;
  final String createDate;
  final String expireDate;

  Token({this.token, this.createDate, this.expireDate});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        token: json['token'],
        createDate: json['create_date'],
        expireDate: json['expire_date']);
  }
}
