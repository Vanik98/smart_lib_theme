import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smart_lib_theme/di/dependency_injection.dart';

import '../../domain/use_cases/get_is_first_launch_use_case.dart';
import '../../domain/use_cases/save_app_theme_use_case.dart';
import '../app_theme_manager.dart';
import 'app_theme_event.dart';

part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  final SaveAppThemeUseCase _saveAppThemeUseCase;
  final GetAppThemUseCase _getAppThemeUseCase;

  AppThemeBloc(this._saveAppThemeUseCase, this._getAppThemeUseCase) : super(AppThemeState.initial()) {
    on<AppThemeChangeThemeEvent>(_changeTheme);
  }

  void _changeTheme(AppThemeChangeThemeEvent event, Emitter<AppThemeState> emitter) async {
    _saveAppThemeUseCase.execute(event.theme);
    final theme = _getAppThemeUseCase.execute(AppThemeManager.appThemes);
    emitter(state.copyWith(theme: theme));
  }
}
