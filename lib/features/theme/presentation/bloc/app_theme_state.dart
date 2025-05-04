part of 'app_theme_bloc.dart';

class AppThemeState {
  ThemeData? theme;

  AppThemeState({this.theme});

  factory AppThemeState.initial() => AppThemeState(theme: AppThemeManager.initialThemeData);

  AppThemeState copyWith({ThemeData? theme}) {
    return AppThemeState(theme: theme ?? this.theme);
  }
}
