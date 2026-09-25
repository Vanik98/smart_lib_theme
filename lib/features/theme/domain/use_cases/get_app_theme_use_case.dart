// smart_lib_theme/features/theme/domain/use_cases/get_app_theme_use_case.dart

import 'package:flutter/material.dart';

import '../entity/app_theme.dart';
import '../repository/app_theme_repository.dart';

/// Use case responsible for resolving which theme the app should start with.
class GetAppThemeUseCase {
  final AppThemeRepository repository;

  GetAppThemeUseCase(this.repository);

  /// Resolves the theme to apply from [themes], which must not be empty.
  ///
  /// 1. The theme whose key was saved previously.
  /// 2. Otherwise the first theme whose brightness matches [platformBrightness].
  /// 3. Otherwise the first theme in the list.
  AppTheme execute(List<AppTheme> themes, {required Brightness platformBrightness}) {
    assert(themes.isNotEmpty, 'themes must not be empty');

    final savedKey = repository.getTheme();
    if (savedKey != null) {
      for (final theme in themes) {
        if (theme.key == savedKey) return theme;
      }
    }

    for (final theme in themes) {
      if (theme.themeData.brightness == platformBrightness) return theme;
    }

    return themes.first;
  }
}
