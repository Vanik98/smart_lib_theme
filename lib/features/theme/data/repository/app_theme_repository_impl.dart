// smart_lib_theme/features/theme/data/repository/app_theme_repository_impl.dart

import '../../domain/repository/app_theme_repository.dart';
import '../datasource/preferences/app_theme_preferences.dart';

/// Concrete implementation of [AppThemeRepository] that uses [AppThemePreferences] for theme persistence.
class AppThemeRepositoryImpl implements AppThemeRepository {
  final AppThemePreferences _preferences;

  AppThemeRepositoryImpl(this._preferences);

  /// Retrieves the saved theme key, or null if no theme has been saved yet.
  @override
  String? getTheme() => _preferences.getTheme();

  /// Persists the given theme key (e.g. "light", "dark").
  @override
  Future<void> saveTheme(String key) => _preferences.saveTheme(key);
}
