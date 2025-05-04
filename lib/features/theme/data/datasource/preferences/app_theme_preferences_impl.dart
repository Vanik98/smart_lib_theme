// smart_lib_theme/features/theme/data/datasource/preferences/app_theme_preferences_impl.dart

import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme_preferences.dart';

/// Concrete implementation of [AppThemePreferences] using [SharedPreferences] for theme persistence.
///
/// This class provides a platform-agnostic way to save and retrieve the current theme key
/// using Flutter's SharedPreferences plugin [[4]]. It stores the theme identifier as a String
/// under a fixed key for easy access and management.
class AppThemePreferencesImpl implements AppThemePreferences {
  /// The key used to store and retrieve the theme preference in SharedPreferences.
  static const String prefKeyAppTheme = "pref_key_app_them";

  /// Instance of SharedPreferences used to perform persistent data operations.
  final SharedPreferences _sharedPreferences;

  /// Creates an instance of [AppThemePreferencesImpl].
  ///
  /// Requires a non-null [SharedPreferences] instance to manage theme preferences.
  AppThemePreferencesImpl(this._sharedPreferences);

  /// Retrieves the saved theme key from persistent storage.
  ///
  /// Returns the theme key if found, or null if no theme has been previously saved.
  @override
  String? getTheme() {
    return _sharedPreferences.getString(prefKeyAppTheme);
  }

  /// Saves the given theme key to persistent storage.
  ///
  /// Used to persist the user's selected theme so it can be restored after app restarts.
  ///
  /// Parameters:
  /// - [key]: The unique identifier of the theme to save (e.g., "light", "dark").
  @override
  void saveTheme(String key) {
    _sharedPreferences.setString(prefKeyAppTheme, key);
  }
}