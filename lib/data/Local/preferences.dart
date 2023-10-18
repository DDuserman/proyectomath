import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  Future<T?> retrieveData<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic value;
    switch (T) {
      case String:
        value = prefs.getString(key);
        break;
      case int:
        value = prefs.getInt(key);
        break;
      case double:
        value = prefs.getDouble(key);
        break;
      default:
        break;
    }
    return value as T?;
  }

  Future<void> storeData<T>(String key, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (T) {
      case String:
        prefs.setString(key, value as String);
        break;
      case int:
        prefs.setInt(key, value as int);
        break;
      case double:
        prefs.setDouble(key, value as double);
        break;
      default:
        break;
    }
  }
}
