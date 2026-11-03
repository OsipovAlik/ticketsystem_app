
import 'package:shared_preferences/shared_preferences.dart';


class Services {
  static Services shared = Services();

  static Future setToken(tok) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", tok);
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
