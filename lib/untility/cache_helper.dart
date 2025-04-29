import 'package:shared_preferences/shared_preferences.dart';

/// Helper class for caching simple key-value pairs locally using SharedPreferences.
class CacheHelper {
  /// Initialize the SharedPreferences instance.
  static SharedPreferences? _prefs;

  /// Ensures SharedPreferences is initialized.
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save a value by key. Supports int, double, bool, String, and List<String>.
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

  /// Retrieve a cached value by key. Returns null if the key is not found.
  static dynamic getData({required String key}) {
    if (_prefs == null) {
      throw Exception(
        "CacheHelper not initialized. Call CacheHelper.init() first.",
      );
    }
    return _prefs!.get(key);
  }

  /// Remove a value from cache by key.
  static Future<bool> removeData({required String key}) async {
    if (_prefs == null) await init();
    return _prefs!.remove(key);
  }

  /// Clear all cached data.
  static Future<bool> clear() async {
    if (_prefs == null) await init();
    return _prefs!.clear();
  }
}
