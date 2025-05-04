// smart_lib_theme/core/theme/default/default_theme_extensions.dart

import 'package:flutter/material.dart';
import 'package:smart_lib_theme/core/theme/extensions/theme_extension.dart';

/// A concrete implementation of [AppThemeExtension] representing the default light theme.
///
/// This class defines a standard light theme using Material Design color tokens.
/// It provides consistent color, shape, and text style definitions for light UIs.
class DefaultLightThemeExtension extends AppThemeExtension {
  /// Creates a new instance of the default light theme extension.
  ///
  /// Initializes all design tokens (colors, shapes, text styles) to their default values
  /// suitable for a light-themed UI. These values are typically used as a baseline for
  /// styling across the application unless overridden by custom themes.
  DefaultLightThemeExtension()
      : super(
    primary: Colors.blue,
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: Colors.blue,
    error: Colors.red,
    onError: Colors.red.shade300,
    surface: Colors.white,
    onSurface: Colors.blue.shade200.withOpacity(0.25),
    onSurfaceSecondary: Colors.blue.shade300,
    displayTextSmallColor: Colors.grey,
    displayTextMediumColor: Colors.grey,
    displayTextLargeColor: Colors.grey,
    titleTextSmallColor: Colors.black,
    titleTextMediumColor: Colors.black,
    titleTextLargeColor: Colors.black,
    bodyTextSmallColor: Colors.grey,
    bodyTextMediumColor: Colors.grey,
    bodyTextLargeColor: Colors.grey,
    headlineTextSmallColor: Colors.white,
    headlineTextMediumColor: Colors.white,
    headlineTextLargeColor: Colors.white,
    labelTextSmallColor: Colors.blue,
    labelTextMediumColor: Colors.blue,
    labelTextLargeColor: Colors.blue,
    warningColor: Colors.yellow,
    infoColor: Colors.grey,
    successColor: Colors.green,
  );
}

/// A concrete implementation of [AppThemeExtension] representing the default dark theme.
///
/// This class defines a standard dark theme using Material Design color tokens.
/// It provides consistent color, shape, and text style definitions for dark UIs.
class DefaultDarkThemeExtension extends AppThemeExtension {
  /// Creates a new instance of the default dark theme extension.
  ///
  /// Initializes all design tokens (colors, shapes, text styles) to their default values
  /// suitable for a dark-themed UI. These values ensure good contrast and readability
  /// in low-light environments while maintaining visual harmony.
  DefaultDarkThemeExtension()
      : super(
    primary: Colors.blue.shade400,
    onPrimary: Colors.blue.shade900,
    secondary: Colors.blue.shade900,
    onSecondary: Colors.white,
    error: Colors.red.shade300,
    onError: Colors.red,
    surface: Colors.grey.shade700,
    onSurface: Colors.blue.shade200.withOpacity(0.25),
    onSurfaceSecondary: Colors.blue.shade100,
    displayTextSmallColor: Colors.blue.shade50,
    displayTextMediumColor: Colors.blue.shade50,
    displayTextLargeColor: Colors.blue.shade50,
    titleTextSmallColor: Colors.blue.shade400,
    titleTextMediumColor: Colors.blue.shade400,
    titleTextLargeColor: Colors.blue.shade400,
    bodyTextSmallColor: Colors.blue.shade50,
    bodyTextMediumColor: Colors.blue.shade50,
    bodyTextLargeColor: Colors.blue.shade50,
    headlineTextSmallColor: Colors.white,
    headlineTextMediumColor: Colors.white,
    headlineTextLargeColor: Colors.white,
    labelTextSmallColor: Colors.blue.shade400,
    labelTextMediumColor: Colors.blue.shade400,
    labelTextLargeColor: Colors.blue.shade400,
    warningColor: Colors.yellow.shade300,
    infoColor: Colors.blue.shade50,
    successColor: Colors.green.shade300,
  );
}