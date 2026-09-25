// smart_lib_theme/features/theme/presentation/app_theme_manager.dart
import 'package:flutter/material.dart';

import '../../../core/utils/exception/app_theme_exception.dart';
import '../../../di/dependency_injection.dart';
import '../domain/entity/app_theme.dart';
import 'bloc/app_theme_bloc.dart';
import 'bloc/app_theme_event.dart';

/// Entry point for initializing, switching and reading the application theme.
///
/// The theme state lives in a single app-wide bloc, so switching themes works from
/// anywhere (including code with no [BuildContext]) and only swaps the [ThemeData]
/// given to your `MaterialApp`: the navigation stack and page state are preserved.
class AppThemeManager {
  factory AppThemeManager() => _instance;
  static final AppThemeManager _instance = AppThemeManager._internal();

  AppThemeManager._internal();

  /// Gets the singleton instance of [AppThemeManager].
  static AppThemeManager get instance => _instance;

  static List<AppTheme> _appThemes = const [];

  /// The themes passed to [init].
  static List<AppTheme> get appThemes => _appThemes;

  /// The theme data resolved during [init] (saved theme, else system brightness, else first).
  static ThemeData? get initialThemeData =>
      themeLocator.isRegistered<AppThemeBloc>() ? themeLocator<AppThemeBloc>().state.themeData : null;

  /// Whether [init] has completed.
  static bool get isInitialized => themeLocator.isRegistered<AppThemeBloc>();

  /// Initializes the theme manager with the supported [themes].
  ///
  /// Must be awaited before `runApp`. The initial theme is the previously saved one,
  /// otherwise the first theme matching the system brightness, otherwise the first theme.
  ///
  /// Throws [AppThemeException] if [themes] is empty or contains duplicate keys.
  static Future<void> init({required List<AppTheme> themes}) async {
    if (themes.isEmpty) {
      throw const AppThemeException(ThemeExceptionConstants.emptyThemes);
    }
    if (themes.map((t) => t.key).toSet().length != themes.length) {
      throw const AppThemeException(ThemeExceptionConstants.duplicateKeys);
    }
    WidgetsFlutterBinding.ensureInitialized();
    _appThemes = List.unmodifiable(themes);
    await AppThemeDependencyInjection.configure(themes: _appThemes);
  }

  /// Switches the whole app to the theme registered under [themeKey] and persists it.
  ///
  /// The current page stays on screen; every widget reading the theme rebuilds with the new one.
  ///
  /// Throws [AppThemeException] if [themeKey] is unknown or [init] has not completed.
  static void changeTheme({
    @Deprecated('No longer needed; the theme can be changed without a BuildContext.') BuildContext? context,
    required String themeKey,
  }) {
    final bloc = _requireBloc();
    final theme = _findTheme(themeKey);
    if (theme == null) {
      throw AppThemeException('${ThemeExceptionConstants.notFoundKey} Key: "$themeKey".');
    }
    bloc.add(AppThemeEvent.changeTheme(theme));
  }

  /// Returns the [ThemeData] currently applied.
  ///
  /// Throws [AppThemeException] if [init] has not completed.
  static ThemeData getCurrentTheme({
    @Deprecated('No longer needed; the theme can be read without a BuildContext.') BuildContext? context,
  }) =>
      _requireBloc().state.themeData;

  /// The [AppTheme] (key and data) currently applied.
  static AppTheme get currentTheme => _requireBloc().state.theme;

  /// The key of the theme currently applied.
  static String get currentThemeKey => currentTheme.key;

  static AppThemeBloc _requireBloc() {
    if (!themeLocator.isRegistered<AppThemeBloc>()) {
      throw const AppThemeException(ThemeExceptionConstants.initErrorMessage);
    }
    return themeLocator<AppThemeBloc>();
  }

  static AppTheme? _findTheme(String key) {
    for (final theme in _appThemes) {
      if (theme.key == key) return theme;
    }
    return null;
  }
}
