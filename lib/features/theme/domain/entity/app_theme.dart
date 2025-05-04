// smart_lib_theme/features/theme/domain/entity/app_theme.dart

import 'package:flutter/material.dart';

/// Represents a single application theme configuration.
///
/// This class holds both the identifier (key) and the associated [ThemeData]
/// for a specific theme, enabling easy switching and management of multiple themes.
class AppTheme {
  /// A unique identifier for this theme (e.g., "light", "dark").
  final String key;

  /// The visual configuration data for this theme.
  final ThemeData themeData;

  /// Creates an instance of [AppTheme].
  ///
  /// Requires non-null values for both:
  /// - [key]: Used to uniquely identify the theme (e.g., for persistence)
  /// - [themeData]: Contains the actual styling information for the app
  AppTheme({required this.key, required this.themeData});
}