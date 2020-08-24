import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String

    String stringValue = prefs.getString(key) ?? "";
    return stringValue;
  }

  static void saveString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.setString(key, value);
  }
}
