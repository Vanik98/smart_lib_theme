/// Public entry point for the `smart_lib_theme` package.
///
/// Import this file in your app or other packages to use the theming API:
///
/// ```dart
/// import 'package:smart_lib_theme/smart_lib_theme.dart';
/// ```
///
/// It re-exports the main classes and helpers needed to:
/// - initialize theme system
/// - listen to theme changes
/// - switch themes
/// - work with default themes and extensions

// Core public API
export 'features/theme/presentation/app_theme_manager.dart';
export 'features/theme/presentation/widgets/app_theme_builder.dart';

// Domain entities
export 'features/theme/domain/entity/app_theme.dart';

// Theme extensions and defaults
export 'core/theme/default/themes.dart';
export 'core/theme/extensions/theme_ext.dart';
export 'core/theme/extensions/theme_extension.dart';
export 'core/theme/default/default_theme_extensions.dart';

