import 'package:shared_preferences/shared_preferences.dart';

class PersistDataSharedPreferences {
  static SharedPreferences _preferences;
  static const _keyTheme = 'theme';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setThemeMode(bool themeMode) async {
    await _preferences.setBool(_keyTheme, themeMode);
  }

  static bool getThemeMode() => _preferences.getBool(_keyTheme);
}
