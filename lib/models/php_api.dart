import 'package:animecountdown/constant.dart';
import 'package:animecountdown/models/token.dart';
import 'package:animecountdown/models/php_api_response.dart';
import 'package:animecountdown/screens/login_screen.dart';
import 'package:encrypt/encrypt.dart' as crypt;
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animecountdown/globals.dart' as globals;

class PhpApi {
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  static Encoding encoding = Encoding.getByName('utf-8');
  static String latestError;
  static bool checkedDb = false;

//	encrypt using AES
  static encrypt(String text) {
    final key = crypt.Key.fromUtf8('EzWHCMgkxuXqeQsAgKzuScWhCqSrSsdO');
    final iv = crypt.IV.fromUtf8('kYeWokoydbIDvZRz');
    final encrypter = crypt.Encrypter(crypt.AES(key, mode: crypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  static checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> keys = prefs.getKeys().toList();
    if (!keys.contains("TokenExpireDate")) {
      globals.navigatorKey.currentState.pushReplacementNamed(LoginScreen.id);
    }
    DateTime expireDate = DateTime.parse(prefs.getString('TokenExpireDate'));
    DateTime now = DateTime.now();
    if (expireDate.compareTo(now) < 0) {
      globals.navigatorKey.currentState.pushReplacementNamed(LoginScreen.id);
    }
  }

  static logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('TokenExpireDate');
    prefs.remove('token');
    prefs.remove('tokenCreateDate');
  }

  static Future<bool> changePassword(
      String oldPassword, String newPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> body = {
      'action': "changePassword",
      'app_uuid': kAppUuid,
      'oldPassword': encrypt(oldPassword),
      'newPassword': encrypt(newPassword),
      'token': prefs.getString('token')
    };
    String jsonBody = json.encode(body);
    http.Response response = await http.post(kUrl,
        headers: headers, body: jsonBody, encoding: encoding);

    int statusCode = response.statusCode;
    PhpApiResponse responseBody =
        PhpApiResponse.fromJson(jsonDecode(response.body));
    if (statusCode == 200) {
      if (responseBody.status == "ok") {
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

  static Future<bool> changeUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> body = {
      'action': "changeUsername",
      'app_uuid': kAppUuid,
      'username': encrypt(username),
      'token': prefs.getString('token')
    };
    String jsonBody = json.encode(body);
    http.Response response = await http.post(kUrl,
        headers: headers, body: jsonBody, encoding: encoding);

    int statusCode = response.statusCode;
    PhpApiResponse responseBody =
        PhpApiResponse.fromJson(jsonDecode(response.body));
    if (statusCode == 200) {
      if (responseBody.status == "ok") {
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

  static Future<bool> login(
      bool loginMode, String username, String password) async {
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
        Token token = responseBody.token;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token.token);
        await prefs.setString("tokenCreateDate", token.createDate);
        await prefs.setString("TokenExpireDate", token.expireDate);

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

  static void favouriteDB({@required int id, bool remove}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> body = {
      'action': remove != null ? "deleteFav" : "addFav",
      'app_uuid': kAppUuid,
      'anilistId': id,
      'token': prefs.getString('token')
    };
    String jsonBody = json.encode(body);
    http.Response response = await http.post(kUrl,
        headers: headers, body: jsonBody, encoding: encoding);

    int statusCode = response.statusCode;
    PhpApiResponse responseBody =
        PhpApiResponse.fromJson(jsonDecode(response.body));
    if (statusCode == 200) {
      if (responseBody.status != "ok") {
        latestError = responseBody.error;
      } else {
        print('success');
      }
    } else {
      latestError = statusCode.toString() + ' ' + response.reasonPhrase;
    }
  }

  static Future<List<int>> getFavIdList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> body = {
      'action': "getFav",
      'app_uuid': kAppUuid,
      'token': prefs.getString('token')
    };
    String jsonBody = json.encode(body);
    http.Response response = await http.post(kUrl,
        headers: headers, body: jsonBody, encoding: encoding);

    int statusCode = response.statusCode;
    print(response.body);
    PhpApiResponse responseBody =
        PhpApiResponse.fromJson(jsonDecode(response.body));
    if (statusCode == 200) {
      if (responseBody.status == "ok") {
        return responseBody.animeList;
      } else {
        latestError = responseBody.error;
        return [];
      }
    } else {
      latestError = statusCode.toString() + ' ' + response.reasonPhrase;
      return [];
    }
  }

  static Future<bool> checkTokenDb() async {
    if (!checkedDb) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> body = {
        'action': "token",
        'app_uuid': kAppUuid,
        'token': prefs.getString('token') ?? ''
      };
      String jsonBody = json.encode(body);
      http.Response response = await http.post(kUrl,
          headers: headers, body: jsonBody, encoding: encoding);

      int statusCode = response.statusCode;
      print('test');
      print(response.body);
      PhpApiResponse responseBody =
          PhpApiResponse.fromJson(jsonDecode(response.body));
      checkedDb = true;
      if (statusCode == 200) {
        if (responseBody.status == "ok") {
          return true;
        } else {
          return false;
        }
      } else {
        latestError = statusCode.toString() + ' ' + response.reasonPhrase;
        return false;
      }
    } else {
      return false;
    }
  }
}
