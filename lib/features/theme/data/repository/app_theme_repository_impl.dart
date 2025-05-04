// smart_lib_theme/features/theme/data/repository/app_theme_repository_impl.dart

import '../../domain/repository/app_theme_repository.dart';
import '../datasource/preferences/app_theme_preferences.dart';

/// Concrete implementation of [AppThemeRepository] that uses [AppThemePreferences] for theme persistence.
///
/// This class serves as a bridge between the domain layer and data layer, handling actual reading and writing
/// of theme preferences using platform-specific storage (e.g. SharedPreferences).
class AppThemeRepositoryImpl implements AppThemeRepository {
  /// Preferences abstraction used to persist theme settings.
  final AppThemePreferences pref;

  /// Creates an instance of [AppThemeRepositoryImpl].
  ///
  /// Requires a non-null [AppThemePreferences] implementation for data access.
  AppThemeRepositoryImpl(this.pref);

  /// Retrieves the saved theme key from persistent storage.
  ///
  /// Returns the theme key if found, or null if no theme has been saved yet.
  @override
  String? getTheme() => pref.getTheme();

  /// Saves the given theme key to persistent storage.
  ///
  /// Used to persist the user's selected theme so it can be restored after app restarts.
  ///
  /// Parameters:
  /// - [key]: The unique identifier of the theme to save (e.g., "light", "dark").
  @override
  void saveThem(String key) => pref.saveTheme(key);
}