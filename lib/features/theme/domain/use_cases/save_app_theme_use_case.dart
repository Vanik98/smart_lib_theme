import '../entity/app_theme.dart';
import '../repository/app_theme_repository.dart';

class SaveAppThemeUseCase {
  final AppThemeRepository repository;

  SaveAppThemeUseCase(this.repository);

  void execute(AppTheme theme) {
    repository.saveThem(theme.key);
  }
}
