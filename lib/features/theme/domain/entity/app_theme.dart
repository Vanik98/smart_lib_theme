// smart_lib_theme/features/theme/domain/entity/app_theme.dart

import 'package:flutter/material.dart';

/// Represents a single application theme configuration.
///
/// This class holds both the identifier (key) and the associated [ThemeData]
/// for a specific theme, enabling easy switching and management of multiple themes.
@immutable
class AppTheme {
  /// A unique identifier for this theme (e.g., "light", "dark"). It is what gets persisted.
  final String key;

  /// The visual configuration data for this theme.
  final ThemeData themeData;

  const AppTheme({required this.key, required this.themeData});
}
