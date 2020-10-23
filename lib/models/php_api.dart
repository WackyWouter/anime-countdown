import 'package:animecountdown/constant.dart';
import 'package:animecountdown/models/token.dart';
import 'package:animecountdown/models/php_api_response.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PhpApi {
  static String latestError;

//	encrypt using AES
  static encrypt(String text) {
    final key = Key.fromUtf8('EzWHCMgkxuXqeQsAgKzuScWhCqSrSsdO');
    final iv = IV.fromUtf8('kYeWokoydbIDvZRz');
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  static Future<bool> login(
      bool loginMode, String username, String password) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final encoding = Encoding.getByName('utf-8');
    String action = loginMode ? 'login' : 'register';
    Map<String, dynamic> body = {
      'action': action,
      'app_uuid': kAppUuid,
      'username': encrypt(username),
      'password': encrypt(password)
    };
    String jsonBody = json.encode(body);
    http.Response response = await http.post(kUrl,
        headers: headers, body: jsonBody, encoding: encoding);

    int statusCode = response.statusCode;
    PhpApiResponse responseBody =
        PhpApiResponse.fromJson(jsonDecode(response.body));
    if (statusCode == 200) {
      if (responseBody.status == "ok") {
//        TODO safe in shared preference
        Token token = responseBody.token;
        return true;
      } else {
        latestError = responseBody.error;
        return false;
      }
    } else {
      latestError = statusCode.toString() + ' ' + response.reasonPhrase;
      return false;
    }
  }
}
