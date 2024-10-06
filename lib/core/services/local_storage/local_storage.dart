import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static String token = "token";

// 1 create SharedPreferences object
// 2 create init method to pass sharedpreferences object
// 3 assign sharedPreferences object to sharedpref to get Instance
// 4 create method to set or to cache data
// 5 create method to get cached data

  static late SharedPreferences _sharedPreferences;

  static Future<SharedPreferences?> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static cachedData({required String key, required dynamic value})  {
    if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else {
       _sharedPreferences.setStringList(key, value);
    }
  }

  static  getData({required String key}) {
    _sharedPreferences.get(key)??"";
  }
}
