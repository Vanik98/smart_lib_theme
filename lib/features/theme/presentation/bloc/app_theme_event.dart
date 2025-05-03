
// Abstract base class that emulates a sealed class
import '../../domain/entity/app_theme.dart';

abstract class AppThemeEvent {
  // Private constructor to prevent instantiation outside this library
  const AppThemeEvent._();

  // Factory to create a theme change event
  factory AppThemeEvent.changeTheme(AppTheme theme) = AppThemeChangeThemeEvent;
}

// Represents a request to change the app theme
final class AppThemeChangeThemeEvent extends AppThemeEvent {
  final AppTheme theme;

  const AppThemeChangeThemeEvent(this.theme) : super._();
}