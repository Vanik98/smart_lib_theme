// smart_lib_theme/features/theme/domain/use_cases/save_app_theme_use_case.dart

import '../entity/app_theme.dart';
import '../repository/app_theme_repository.dart';

/// Use case responsible for saving the currently selected application theme.
///
/// This class abstracts the logic for persisting the selected theme using the provided [AppThemeRepository].
class SaveAppThemeUseCase {
  /// Repository used to perform data operations for saving the theme.
  final AppThemeRepository repository;

  /// Creates an instance of [SaveAppThemeUseCase].
  ///
  /// Requires a non-null [AppThemeRepository] implementation for data access.
  SaveAppThemeUseCase(this.repository);

  /// Executes the use case to save the selected theme.
  ///
  /// Retrieves the theme key from the provided [AppTheme] object and delegates the
  /// persistence logic to the [repository]. This ensures the theme preference is saved
  /// across app sessions.
  ///
  /// Parameters:
  /// - [theme]: The [AppTheme] object whose key will be saved.
  void execute(AppTheme theme) {
    repository.saveThem(theme.key);
  }
}