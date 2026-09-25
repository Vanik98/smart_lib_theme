/// Thrown when the theme system is used incorrectly, e.g. before
/// [AppThemeManager.init] completes or with an unknown theme key.
class AppThemeException implements Exception {
  final String message;

  const AppThemeException(this.message);

  @override
  String toString() => 'AppThemeException: $message';
}

abstract class ThemeExceptionConstants {
  static const initErrorMessage =
      "AppThemeManager is not initialized. Await AppThemeManager.init() before runApp() and before using AppThemeBuilder or AppThemeManager.";
  static const appThemeMessage = initErrorMessage;
  static const notFoundKey = "There is no theme with this key.";
  static const emptyThemes = "AppThemeManager.init() requires at least one theme.";
  static const duplicateKeys = "Theme keys passed to AppThemeManager.init() must be unique.";
}
