
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Services {
  static Services shared = Services();
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Auth token holds the session credential, so it is kept in the
  /// platform secure storage (Keychain/Keystore) instead of plaintext
  /// SharedPreferences.
  static Future<void> setToken(String tok) async {
    return _secureStorage.write(key: "token", value: tok);
  }

  static Future<String> getToken() async {
    return await _secureStorage.read(key: "token") ?? "";
  }

  static Future<void> removeToken() async {
    return _secureStorage.delete(key: "token");
  }

    static Future setName(tok) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("name", tok);
  }
    static Future setPhone(tok) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("phone", tok);
  }
    static Future setEmail(tok) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("email", tok);
  }

  static Future setLang(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("globalLanguage", lang);
  }
}
