// smart_lib_theme/core/theme/extensions/theme_extension.dart

import 'package:flutter/material.dart';

/// Custom theme extension that defines application-specific design tokens.
///
/// This class extends [ThemeExtension] to allow custom styling properties (such as colors, shapes,
/// and text styles) to be accessed through the [ThemeData] object. It enables developers to define
/// a consistent design system across the app using Flutter's built-in theming capabilities [[4]].
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  // Default values for shape-related tokens
  static const _buttonCornerRadiusValue = 8.0;
  static const _outlinedButtonBorderWidthValue = 1.0;
  static const _textFormFieldBorderRadiusValue = 8.0;
  static const _textFormFieldBorderSideValue = 1.0;
  static const _textFormFieldFocusedBorderSideValue = 2.0;
  static const _buttonMinSizeHeightValue = 40.0;
  static const _textFormFieldFocusedBorderSideWidthValue = 2.0;

  /// Exposes the default minimum height value for buttons.
  static double get buttonMinSizeHeightValue => _buttonMinSizeHeightValue;

  // Color Tokens
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color surface;
  final Color onSurface;
  final Color onSurfaceSecondary;

  final Color warningColor;
  final Color infoColor;
  final Color successColor;

  // Shape Tokens
  final double buttonBorderRadius;
  final double outlinedButtonBorderWidth;
  final double buttonMinSizeHeight;

  final double textFormFieldBorderRadius;
  final double textFormFieldBorderSide;
  final double textFormFieldFocusedBorderSideValue;
  final double textFormFieldFocusedBorderSideWidth;

  // Text Style Tokens
  final Color displayTextSmallColor;
  final Color displayTextMediumColor;
  final Color displayTextLargeColor;

  final Color titleTextSmallColor;
  final Color titleTextMediumColor;
  final Color titleTextLargeColor;

  final Color bodyTextSmallColor;
  final Color bodyTextMediumColor;
  final Color bodyTextLargeColor;

  final Color headlineTextSmallColor;
  final Color headlineTextMediumColor;
  final Color headlineTextLargeColor;

  final Color labelTextSmallColor;
  final Color labelTextMediumColor;
  final Color labelTextLargeColor;

  /// Creates an instance of [AppThemeExtension].
  ///
  /// Requires explicit definitions for all color and text style tokens.
  /// Optional shape parameters use predefined defaults if not provided.
  AppThemeExtension({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.surface,
    required this.onSurface,
    required this.onSurfaceSecondary,
    this.buttonBorderRadius = _buttonCornerRadiusValue,
    this.outlinedButtonBorderWidth = _outlinedButtonBorderWidthValue,
    this.textFormFieldBorderRadius = _textFormFieldBorderRadiusValue,
    this.textFormFieldBorderSide = _textFormFieldBorderSideValue,
    this.textFormFieldFocusedBorderSideValue = _textFormFieldFocusedBorderSideValue,
    this.buttonMinSizeHeight = _buttonMinSizeHeightValue,
    this.textFormFieldFocusedBorderSideWidth = _textFormFieldFocusedBorderSideWidthValue,
    required this.displayTextSmallColor,
    required this.displayTextMediumColor,
    required this.displayTextLargeColor,
    required this.titleTextSmallColor,
    required this.titleTextMediumColor,
    required this.titleTextLargeColor,
    required this.bodyTextSmallColor,
    required this.bodyTextMediumColor,
    required this.bodyTextLargeColor,
    required this.headlineTextSmallColor,
    required this.headlineTextMediumColor,
    required this.headlineTextLargeColor,
    required this.labelTextSmallColor,
    required this.labelTextMediumColor,
    required this.labelTextLargeColor,
    required this.warningColor,
    required this.infoColor,
    required this.successColor,
  });

  @override
  ThemeExtension<AppThemeExtension> copyWith() => this;

  @override
  ThemeExtension<AppThemeExtension> lerp(covariant ThemeExtension<AppThemeExtension>? other, double t) => this;

  /// Returns a fixed-size dimension for buttons.
  Size get buttonMinSize => Size(double.infinity, buttonMinSizeHeight);

  /// Returns a rounded rectangle border shape based on current corner radius.
  RoundedRectangleBorder get roundedRectangleShape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonBorderRadius));
}