// smart_lib_theme/features/theme/domain/use_cases/get_app_theme_use_case.dart

import 'package:flutter/material.dart';

import '../entity/app_theme.dart';
import '../repository/app_theme_repository.dart';

/// Use case responsible for retrieving the saved application theme.
///
/// This class fetches the currently stored theme key from the [AppThemeRepository]
/// and matches it with the provided list of available themes to return the correct [ThemeData].
class GetAppThemUseCase {
  /// The repository used to access persistent theme storage.
  final AppThemeRepository repository;

  /// Creates an instance of [GetAppThemUseCase].
  ///
  /// Requires a non-null [AppThemeRepository] implementation for data access.
  GetAppThemUseCase(this.repository);

  /// Executes the use case logic to retrieve the current theme.
  ///
  /// 1. Fetches the saved theme key using [AppThemeRepository.getTheme()]
  /// 2. Loops through the provided [appTheme] list to find a match
  /// 3. Returns the corresponding [ThemeData], or null if no match is found
  ///
  /// Parameters:
  /// - [appTheme]: A list of available [AppTheme] objects containing theme keys and [ThemeData]
  ///
  /// Returns:
  /// - [ThemeData] for the saved theme, or a theme that matches system brightness
  ///   ("dark"/"light") when nothing is saved yet. If nothing matches, returns null.
  ThemeData? execute(List<AppTheme> appTheme) {
    String? theme = repository.getTheme();

    if (theme == null) {
      return appTheme.isNotEmpty ? appTheme.first.themeData : null;
    }

    for (var i = 0; i < appTheme.length; i++) {
      if (appTheme[i].key == theme) {
        return appTheme[i].themeData;
      }
    }

    return appTheme.isNotEmpty ? appTheme.first.themeData : null;
  }
}
