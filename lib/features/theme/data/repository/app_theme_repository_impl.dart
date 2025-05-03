import '../../domain/repository/app_theme_repository.dart';
import '../datasource/preferences/app_theme_preferences.dart';

class AppThemeRepositoryImpl implements AppThemeRepository {
  final AppThemePreferences pref;

  AppThemeRepositoryImpl(this.pref);

  @override
  String? getTheme() => pref.getTheme();

  @override
  void saveThem(String key) => pref.saveTheme(key);
}
