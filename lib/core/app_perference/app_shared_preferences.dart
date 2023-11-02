import 'dart:convert';

import 'package:food/core/utils/constant.dart';
import 'package:food/features/auth/data/models/response_model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static int id = -1;
  static String token = "";

  static Future<void> setKey(String key, String value) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  static Future<void> saveUser(String key, UserModel user) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt(AppConstants.ID, user.id!);
    await preferences.setString(AppConstants.TOKEN, user.jwtToken!);
    await preferences.setString(AppConstants.USER, jsonEncode(user.toJson()));
  }

  static Future<UserModel> getUser() async {
    final preferences = await SharedPreferences.getInstance();
    if (await isLogin()) {
      var userStr = preferences.getString(AppConstants.USER).toString();
      UserModel userModel = UserModel.fromJson(jsonDecode(userStr));
      return userModel;
    }
    return UserModel();
  }

  static Future<String> getKey(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? "";
  }

  static Future<void> clear() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<bool> isLogin() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.getInt(AppConstants.ID) == null) {
      return false;
    }
    return true;
  }
}
