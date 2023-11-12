import 'dart:convert';

import 'package:phone_book_app/models/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void save(String key, dynamic value) async {
    await _prefs.setString(key, jsonEncode(value));
  }

  static dynamic getKey(String key) async {
    if(_prefs.containsKey('contacts')) {
      return jsonDecode(_prefs.getString('contacts')!);
    }
    return [];
  }

}