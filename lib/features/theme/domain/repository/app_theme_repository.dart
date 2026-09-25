abstract interface class AppThemeRepository {
  Future<void> saveTheme(String key);

  String? getTheme();
}
