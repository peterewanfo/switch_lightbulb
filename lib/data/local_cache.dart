import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCache {
  SharedPreferences sharedPreferences;

  LocalCache({
    required this.sharedPreferences,
  });

  Object? getFromLocalCache(String key) {
    try {
      return sharedPreferences.get(key);
    } catch (e) {
      /// Print Cached Error
    }
    return null;
  }

  Future<void> removeFromLocalCache(String key) async {
    await sharedPreferences.remove(key);
  }

  Future<void> saveToLocalCache({required String key, required value}) async {

    if (value is String) {
      await sharedPreferences.setString(key, value);
    }
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
    }
    if (value is int) {
      await sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
    }
    if (value is List<String>) {
      await sharedPreferences.setStringList(key, value);
    }
    if (value is Map) {
      await sharedPreferences.setString(key, json.encode(value));
    }
  }
}
