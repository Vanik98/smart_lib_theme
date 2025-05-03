import 'package:flutter/material.dart';

import '../entity/app_theme.dart';
import '../repository/app_theme_repository.dart';

class GetAppThemUseCase {
  final AppThemeRepository repository;

  GetAppThemUseCase(this.repository);

  ThemeData? execute(List<AppTheme> appTheme) {
    ThemeData? themeData;
    String? theme = repository.getTheme();
    for (var i = 0; i < appTheme.length; i++) {
      if (appTheme[i].key == theme) {
        themeData = appTheme[i].themeData;
        break;
      }
    }
    return themeData;
  }
}
