import 'package:get_it/get_it.dart';

import '../features/theme/presentation/di/app_theme_di.dart';

GetIt themeLocator = GetIt.instance;

class AppThemeDependencyInjection {
  static Future<void> configure() async {
    await appThemeModule();
  }
}
