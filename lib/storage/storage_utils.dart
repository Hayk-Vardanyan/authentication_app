import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model/user_model.dart';

class Preferences {
  Preferences._();

  static const authToken = 'authToken';
  static const user = 'user';
}

class StorageUtils {
  static Future<SharedPreferences> get sharedInstance =>
      SharedPreferences.getInstance();

  static Future<String?> getAccessToken() async {
    return _getString(Preferences.authToken);
  }

  static Future<void> setAccessToken(String authToken) async {
    await _setString(Preferences.authToken, authToken);
  }

  static Future<void> setUser(UserModel user) async {
    await _save(Preferences.user, user);
  }

  static Future<UserModel?> getUser() async {
    final string = await _getString(Preferences.user);

    if (string != null) {
      final user = jsonDecode(string);
      return UserModel.fromJson(user);
    }

    return null;
  }

  static Future<void> removeAccessToken() async {
    await _remove(Preferences.authToken);
  }

  static Future<void> removeUser() async {
    final user = await sharedInstance;
    await user.remove(Preferences.user);
  } // new

  static Future<bool> isLoggedIn() async {
    final accessToken = await StorageUtils.getAccessToken();
    return accessToken != null;
  }

  /// Private helper functions
  static Future<T?> _read<T>(String key) async {
    final prefs = await sharedInstance;
    final value = prefs.getString(key);
    return value == null ? null : json.decode(value) as T;
  }

  static Future<void> _save(String key, Object value) async {
    final prefs = await sharedInstance;
    await prefs.setString(key, json.encode(value));
  }

  static Future<void> _remove(String key) async {
    final prefs = await sharedInstance;
    await prefs.remove(key);
  }

  static Future<void> clear() async {
    final prefs = await sharedInstance;
    await prefs.clear();
  }

  // ignore: avoid_positional_boolean_parameters
  static Future<void> _setBool(String key, bool value) async {
    final prefs = await sharedInstance;

    await prefs.setBool(key, value);
  }

  static Future<bool> _getBool(String key) async {
    final prefs = await sharedInstance;
    return prefs.getBool(key) ?? false;
  }

  static Future<void> _setString(String key, String value) async {
    final prefs = await sharedInstance;
    await prefs.setString(key, value);
  }

  static Future<String?> _getString(String key) async {
    final prefs = await sharedInstance;
    return prefs.getString(key);
  }
}
