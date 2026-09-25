import '../../domain/entity/app_theme.dart';

sealed class AppThemeEvent {
  const AppThemeEvent();

  const factory AppThemeEvent.changeTheme(AppTheme theme) = AppThemeChangeThemeEvent;
}

/// Represents a request to change the app theme.
final class AppThemeChangeThemeEvent extends AppThemeEvent {
  final AppTheme theme;

  const AppThemeChangeThemeEvent(this.theme);
}
