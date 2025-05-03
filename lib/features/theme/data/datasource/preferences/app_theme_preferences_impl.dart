import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme_preferences.dart';

class AppThemePreferencesImpl implements AppThemePreferences {
  static const String prefKeyAppTheme = "pref_key_app_them";

  final SharedPreferences _sharedPreferences;

  AppThemePreferencesImpl(this._sharedPreferences);

  @override
  String? getTheme() {
    return _sharedPreferences.getString(prefKeyAppTheme);
  }

  @override
  void saveTheme(String key) {
    _sharedPreferences.setString(prefKeyAppTheme, key);
  }
}
