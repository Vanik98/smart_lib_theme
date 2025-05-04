// smart_lib_theme/features/theme/presentation/bloc/app_theme_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/get_is_first_launch_use_case.dart';
import '../../domain/use_cases/save_app_theme_use_case.dart';
import '../app_theme_manager.dart';
import 'app_theme_event.dart';

part 'app_theme_state.dart';

/// A [Bloc] responsible for managing and applying application-wide theme changes.
///
/// This bloc listens to [AppThemeEvent] events, executes use cases to persist and retrieve themes,
/// and emits updated states that trigger UI rebuilds with the new theme.
class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  /// Use case to save the selected theme preference persistently.
  final SaveAppThemeUseCase _saveAppThemeUseCase;

  /// Use case to retrieve the currently saved theme.
  final GetAppThemUseCase _getAppThemeUseCase;

  /// Creates an instance of [AppThemeBloc].
  ///
  /// Requires instances of:
  /// - [SaveAppThemeUseCase]
  /// - [GetAppThemUseCase]
  ///
  /// Initializes state with the default theme using [AppThemeState.initial].
  AppThemeBloc(this._saveAppThemeUseCase, this._getAppThemeUseCase) : super(AppThemeState.initial()) {
    on<AppThemeChangeThemeEvent>(_changeTheme);
  }

  /// Handles the logic when a theme change event is triggered.
  ///
  /// 1. Persists the new theme using [SaveAppThemeUseCase]
  /// 2. Retrieves the updated theme using [GetAppThemUseCase]
  /// 3. Emits a new state with the updated [ThemeData] to rebuild the UI [[4]]
  void _changeTheme(AppThemeChangeThemeEvent event, Emitter<AppThemeState> emitter) async {
    _saveAppThemeUseCase.execute(event.theme);
    final theme = _getAppThemeUseCase.execute(AppThemeManager.appThemes);
    emitter(state.copyWith(theme: theme));
  }
}
