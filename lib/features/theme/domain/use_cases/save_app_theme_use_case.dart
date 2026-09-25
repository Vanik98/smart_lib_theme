// smart_lib_theme/features/theme/domain/use_cases/save_app_theme_use_case.dart

import '../entity/app_theme.dart';
import '../repository/app_theme_repository.dart';

/// Use case responsible for persisting the currently selected application theme.
class SaveAppThemeUseCase {
  final AppThemeRepository repository;

  SaveAppThemeUseCase(this.repository);

  /// Saves the key of [theme] so it is restored on the next app launch.
  Future<void> execute(AppTheme theme) => repository.saveTheme(theme.key);
}
