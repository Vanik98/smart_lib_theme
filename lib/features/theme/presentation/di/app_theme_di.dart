import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../di/dependency_injection.dart';
import '../../data/datasource/preferences/app_theme_preferences.dart';
import '../../data/datasource/preferences/app_theme_preferences_impl.dart';
import '../../data/repository/app_theme_repository_impl.dart';
import '../../domain/entity/app_theme.dart';
import '../../domain/repository/app_theme_repository.dart';
import '../../domain/use_cases/get_app_theme_use_case.dart';
import '../../domain/use_cases/save_app_theme_use_case.dart';
import '../bloc/app_theme_bloc.dart';

Future<void> appThemeModule({required List<AppTheme> themes}) async {
  // datasource
  themeLocator.registerSingleton<AppThemePreferences>(AppThemePreferencesImpl(await SharedPreferences.getInstance()));
  // repository
  themeLocator.registerSingleton<AppThemeRepository>(AppThemeRepositoryImpl(themeLocator()));
  // use cases
  themeLocator.registerSingleton(GetAppThemeUseCase(themeLocator()));
  themeLocator.registerSingleton(SaveAppThemeUseCase(themeLocator()));
  // bloc
  final initialTheme = themeLocator<GetAppThemeUseCase>().execute(
    themes,
    platformBrightness: WidgetsBinding.instance.platformDispatcher.platformBrightness,
  );
  themeLocator.registerSingleton(
    AppThemeBloc(themeLocator(), initialTheme: initialTheme),
    dispose: (bloc) => bloc.close(),
  );
}
