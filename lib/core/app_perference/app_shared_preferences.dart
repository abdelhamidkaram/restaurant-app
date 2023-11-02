import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences{
  static String token = "";
  static Future<void> setKey(String key, String value)async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  static Future<String> getKey(String key)async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(key)??"";
  }

  static Future<void> clear()async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}