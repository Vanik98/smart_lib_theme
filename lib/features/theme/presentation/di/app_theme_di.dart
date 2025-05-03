import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_lib_theme/features/theme/presentation/bloc/app_theme_bloc.dart';

import '../../../../di/dependency_injection.dart';
import '../../data/datasource/preferences/app_theme_preferences.dart';
import '../../data/datasource/preferences/app_theme_preferences_impl.dart';
import '../../data/repository/app_theme_repository_impl.dart';
import '../../domain/repository/app_theme_repository.dart';
import '../../domain/use_cases/get_is_first_launch_use_case.dart';
import '../../domain/use_cases/save_app_theme_use_case.dart';

Future<void> appThemeModule() async {
  //datasource
  themeLocator.registerSingleton<AppThemePreferences>(AppThemePreferencesImpl(await SharedPreferences.getInstance()));
  //repo
  themeLocator.registerSingleton<AppThemeRepository>(AppThemeRepositoryImpl(themeLocator.get()));
  //useCases
  themeLocator.registerSingleton(GetAppThemUseCase(themeLocator.get()));
  themeLocator.registerSingleton(SaveAppThemeUseCase(themeLocator.get()));
  themeLocator.registerSingleton(AppThemeBloc(themeLocator.get(), themeLocator.get()));
}
