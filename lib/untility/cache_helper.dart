import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (_prefs == null) await init();

    if (value is int) return _prefs!.setInt(key, value);
    if (value is double) return _prefs!.setDouble(key, value);
    if (value is bool) return _prefs!.setBool(key, value);
    if (value is String) return _prefs!.setString(key, value);
    if (value is List<String>) return _prefs!.setStringList(key, value);

    throw Exception("Unsupported value type");
  }

  static dynamic getData({required String key}) {
    if (_prefs == null) {
      throw Exception(
        "CacheHelper not initialized. Call CacheHelper.init() first.",
      );
    }
    return _prefs!.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    if (_prefs == null) await init();
    return _prefs!.remove(key);
  }

  static Future<bool> clear() async {
    if (_prefs == null) await init();
    return _prefs!.clear();
  }
}
