abstract interface class AppThemePreferences {
  Future<void> saveTheme(String key);

  String? getTheme();
}
