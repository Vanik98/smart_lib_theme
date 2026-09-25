part of 'app_theme_bloc.dart';

@immutable
class AppThemeState {
  final AppTheme theme;

  const AppThemeState({required this.theme});

  ThemeData get themeData => theme.themeData;

  @override
  bool operator ==(Object other) =>
      other is AppThemeState && other.theme.key == theme.key && identical(other.theme.themeData, theme.themeData);

  @override
  int get hashCode => Object.hash(theme.key, theme.themeData);
}
