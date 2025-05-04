import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lib_theme/di/dependency_injection.dart';
import 'package:smart_lib_theme/features/theme/presentation/bloc/app_theme_bloc.dart';
import 'package:smart_lib_theme/features/theme/presentation/bloc/app_theme_event.dart';

import '../../../core/utils/exception/constants/exception_constants.dart';
import '../domain/entity/app_theme.dart';
import '../domain/use_cases/get_is_first_launch_use_case.dart';

class AppThemeManager {
  static ThemeData? get initialThemeData => _initialThemeData;

  static List<AppTheme> get appThemes => _appThemes;

  static ThemeData? _initialThemeData;
  static late List<AppTheme> _appThemes;

  factory AppThemeManager() => _instance;
  static final AppThemeManager _instance = AppThemeManager._internal();

  AppThemeManager._internal();

  static AppThemeManager get instance => _instance;

  static Future<void> init({required List<AppTheme> themes}) async {
    _appThemes = themes;
    WidgetsFlutterBinding.ensureInitialized();
    await AppThemeDependencyInjection.configure();
    _initialThemeData = themeLocator.get<GetAppThemUseCase>().execute(_appThemes);
  }

  static void changeTheme({required BuildContext context, required AppTheme theme}) {
    try {
      context.read<AppThemeBloc>().add(AppThemeEvent.changeTheme(theme));
    } catch (e) {
      throw Exception(ThemeExceptionConstants.initErrorMessage);
    }
  }

  static ThemeData? getCurrentTheme({required BuildContext context}) {
    try {
      return context.read<AppThemeBloc>().state.theme;
    } catch (e) {
      throw Exception(ThemeExceptionConstants.initErrorMessage);
    }
  }
}
