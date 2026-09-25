import 'package:get_it/get_it.dart';

import '../features/theme/domain/entity/app_theme.dart';
import '../features/theme/presentation/di/app_theme_di.dart';

/// Service locator private to this package, so registrations never collide with
/// the host app's own `GetIt.instance`.
final GetIt themeLocator = GetIt.asNewInstance();

class AppThemeDependencyInjection {
  /// Registers all theme dependencies. Safe to call more than once: previous
  /// registrations are disposed first.
  static Future<void> configure({required List<AppTheme> themes}) async {
    await themeLocator.reset();
    await appThemeModule(themes: themes);
  }
}
