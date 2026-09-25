// smart_lib_theme/features/theme/presentation/bloc/app_theme_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/app_theme.dart';
import '../../domain/use_cases/save_app_theme_use_case.dart';
import 'app_theme_event.dart';

part 'app_theme_state.dart';

/// A [Bloc] responsible for managing and applying application-wide theme changes.
///
/// Emits the new theme immediately so the UI updates without waiting for disk I/O,
/// then persists the selection.
class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  final SaveAppThemeUseCase _saveAppThemeUseCase;

  AppThemeBloc(this._saveAppThemeUseCase, {required AppTheme initialTheme})
      : super(AppThemeState(theme: initialTheme)) {
    on<AppThemeChangeThemeEvent>(_onChangeTheme);
  }

  Future<void> _onChangeTheme(AppThemeChangeThemeEvent event, Emitter<AppThemeState> emit) async {
    final newState = AppThemeState(theme: event.theme);
    if (newState == state) return;
    emit(newState);
    await _saveAppThemeUseCase.execute(event.theme);
  }
}
