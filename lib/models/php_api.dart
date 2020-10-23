import 'package:encrypt/encrypt.dart';

class PhpApi {
//	encrypt using AES
  static encrypt(String text) {
    final key = Key.fromUtf8('EzWHCMgkxuXqeQsAgKzuScWhCqSrSsdO');
    final iv = IV.fromUtf8('kYeWokoydbIDvZRz');
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  static login() {}

  static register() {}
}
