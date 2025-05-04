// smart_lib_theme/features/theme/presentation/app_theme_manager.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lib_theme/di/dependency_injection.dart';
import 'package:smart_lib_theme/features/theme/presentation/bloc/app_theme_bloc.dart';
import 'package:smart_lib_theme/features/theme/presentation/bloc/app_theme_event.dart';

import '../../../core/utils/exception/constants/exception_constants.dart';
import '../domain/entity/app_theme.dart';
import '../domain/use_cases/get_is_first_launch_use_case.dart';

/// Singleton manager class for handling application-wide theme state and persistence.
///
/// This class provides:
/// - Initialization of supported themes
/// - Theme switching functionality
/// - Access to current theme data
/// - Integration with Flutter Bloc for state management
class AppThemeManager {
  /// Gets the initial theme data loaded during initialization
  static ThemeData? get initialThemeData => _initialThemeData;

  /// Gets the list of available application themes
  static List<AppTheme> get appThemes => _appThemes;

  static ThemeData? _initialThemeData;
  static late List<AppTheme> _appThemes;

  /// Private constructor for singleton implementation
  factory AppThemeManager() => _instance;
  static final AppThemeManager _instance = AppThemeManager._internal();

  AppThemeManager._internal();

  /// Gets the singleton instance of [AppThemeManager]
  static AppThemeManager get instance => _instance;

  /// Initializes the theme manager with supported themes
  ///
  /// 1. Ensures Flutter binding is initialized
  /// 2. Configures dependency injection container
  /// 3. Retrieves initial theme using [GetAppThemUseCase]
  ///
  /// Throws exceptions from dependency injection or theme loading
  static Future<void> init({required List<AppTheme> themes}) async {
    _appThemes = themes;
    WidgetsFlutterBinding.ensureInitialized();
    await AppThemeDependencyInjection.configure();
    _initialThemeData = themeLocator.get<GetAppThemUseCase>().execute(_appThemes);
  }

  /// Changes the current application theme
  ///
  /// Dispatches [AppThemeEvent.changeTheme] through Bloc to update theme state
  ///
  /// Parameters:
  /// - [context]: BuildContext for accessing Bloc provider
  /// - [themeKey]: The new theme key to apply
  ///
  /// Throws [Exception] with message from [ThemeExceptionConstants] if Bloc operation fails
  static void changeTheme({required BuildContext context, required String themeKey}) {
    ThemeData? themeData;
    for (var i = 0; i < _appThemes.length; i++) {
      if (_appThemes[i].key == themeKey) {
        themeData = _appThemes[i].themeData;
        break;
      }
    }
    if (themeData == null) {
      throw Exception(ThemeExceptionConstants.notFoundKey);
    }
    try {
      context.read<AppThemeBloc>().add(AppThemeEvent.changeTheme(AppTheme(key: themeKey, themeData: themeData)));
    } catch (e) {
      throw Exception(ThemeExceptionConstants.appThemeMessage);
    }
  }

  /// Gets the current theme data from Bloc state
  ///
  /// Parameters:
  /// - [context]: BuildContext for accessing Bloc state
  ///
  /// Returns [ThemeData] of current theme or null if not initialized
  ///
  /// Throws [Exception] with message from [ThemeExceptionConstants] if Bloc access fails
  static ThemeData? getCurrentTheme({required BuildContext context}) {
    try {
      return context.read<AppThemeBloc>().state.theme;
    } catch (e) {
      throw Exception(ThemeExceptionConstants.appThemeMessage);
    }
  }
}
