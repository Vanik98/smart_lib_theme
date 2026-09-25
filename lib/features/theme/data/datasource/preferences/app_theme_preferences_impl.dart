// smart_lib_theme/features/theme/data/datasource/preferences/app_theme_preferences_impl.dart

import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme_preferences.dart';

/// Concrete implementation of [AppThemePreferences] using [SharedPreferences] for theme persistence.
///
/// This class provides a platform-agnostic way to save and retrieve the current theme key
/// using Flutter's SharedPreferences plugin. It stores the theme identifier as a String
/// under a fixed key for easy access and management.
class AppThemePreferencesImpl implements AppThemePreferences {
  /// The key used to store and retrieve the theme preference in SharedPreferences.
  ///
  /// The spelling must stay as-is: renaming it would lose themes saved by earlier versions.
  static const String prefKeyAppTheme = "pref_key_app_them";

  /// Instance of SharedPreferences used to perform persistent data operations.
  final SharedPreferences _sharedPreferences;

  /// Creates an instance of [AppThemePreferencesImpl].
  AppThemePreferencesImpl(this._sharedPreferences);

  /// Retrieves the saved theme key from persistent storage.
  ///
  /// Returns the theme key if found, or null if no theme has been previously saved.
  @override
  String? getTheme() => _sharedPreferences.getString(prefKeyAppTheme);

  /// Saves the given theme key to persistent storage so it can be restored after app restarts.
  @override
  Future<void> saveTheme(String key) => _sharedPreferences.setString(prefKeyAppTheme, key);
}
