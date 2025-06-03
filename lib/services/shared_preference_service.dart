
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static Future<void> save(String key , String value)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static Future<String?> getString(String key)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<void> saveBool(String key , bool value)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  static Future<bool?> getBool(String key)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }
}