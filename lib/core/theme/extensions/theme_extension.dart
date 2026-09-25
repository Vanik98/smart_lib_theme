// smart_lib_theme/core/theme/extensions/theme_extension.dart

import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

/// Custom theme extension that defines application-specific design tokens.
///
/// This class extends [ThemeExtension] to allow custom styling properties (such as colors, shapes,
/// and text styles) to be accessed through the [ThemeData] object. It enables developers to define
/// a consistent design system across the app using Flutter's built-in theming capabilities.
///
/// Subclasses are looked up as [AppThemeExtension], so
/// `Theme.of(context).extension<AppThemeExtension>()` finds them.
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
  const AppThemeExtension({
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
  AppThemeExtension copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? error,
    Color? onError,
    Color? surface,
    Color? onSurface,
    Color? onSurfaceSecondary,
    double? buttonBorderRadius,
    double? outlinedButtonBorderWidth,
    double? textFormFieldBorderRadius,
    double? textFormFieldBorderSide,
    double? textFormFieldFocusedBorderSideValue,
    double? buttonMinSizeHeight,
    double? textFormFieldFocusedBorderSideWidth,
    Color? displayTextSmallColor,
    Color? displayTextMediumColor,
    Color? displayTextLargeColor,
    Color? titleTextSmallColor,
    Color? titleTextMediumColor,
    Color? titleTextLargeColor,
    Color? bodyTextSmallColor,
    Color? bodyTextMediumColor,
    Color? bodyTextLargeColor,
    Color? headlineTextSmallColor,
    Color? headlineTextMediumColor,
    Color? headlineTextLargeColor,
    Color? labelTextSmallColor,
    Color? labelTextMediumColor,
    Color? labelTextLargeColor,
    Color? warningColor,
    Color? infoColor,
    Color? successColor,
  }) {
    return AppThemeExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceSecondary: onSurfaceSecondary ?? this.onSurfaceSecondary,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      outlinedButtonBorderWidth: outlinedButtonBorderWidth ?? this.outlinedButtonBorderWidth,
      textFormFieldBorderRadius: textFormFieldBorderRadius ?? this.textFormFieldBorderRadius,
      textFormFieldBorderSide: textFormFieldBorderSide ?? this.textFormFieldBorderSide,
      textFormFieldFocusedBorderSideValue: textFormFieldFocusedBorderSideValue ?? this.textFormFieldFocusedBorderSideValue,
      buttonMinSizeHeight: buttonMinSizeHeight ?? this.buttonMinSizeHeight,
      textFormFieldFocusedBorderSideWidth: textFormFieldFocusedBorderSideWidth ?? this.textFormFieldFocusedBorderSideWidth,
      displayTextSmallColor: displayTextSmallColor ?? this.displayTextSmallColor,
      displayTextMediumColor: displayTextMediumColor ?? this.displayTextMediumColor,
      displayTextLargeColor: displayTextLargeColor ?? this.displayTextLargeColor,
      titleTextSmallColor: titleTextSmallColor ?? this.titleTextSmallColor,
      titleTextMediumColor: titleTextMediumColor ?? this.titleTextMediumColor,
      titleTextLargeColor: titleTextLargeColor ?? this.titleTextLargeColor,
      bodyTextSmallColor: bodyTextSmallColor ?? this.bodyTextSmallColor,
      bodyTextMediumColor: bodyTextMediumColor ?? this.bodyTextMediumColor,
      bodyTextLargeColor: bodyTextLargeColor ?? this.bodyTextLargeColor,
      headlineTextSmallColor: headlineTextSmallColor ?? this.headlineTextSmallColor,
      headlineTextMediumColor: headlineTextMediumColor ?? this.headlineTextMediumColor,
      headlineTextLargeColor: headlineTextLargeColor ?? this.headlineTextLargeColor,
      labelTextSmallColor: labelTextSmallColor ?? this.labelTextSmallColor,
      labelTextMediumColor: labelTextMediumColor ?? this.labelTextMediumColor,
      labelTextLargeColor: labelTextLargeColor ?? this.labelTextLargeColor,
      warningColor: warningColor ?? this.warningColor,
      infoColor: infoColor ?? this.infoColor,
      successColor: successColor ?? this.successColor,
    );
  }

  /// Interpolates every token so custom colors animate together with the
  /// built-in [ColorScheme] when the theme changes.
  @override
  AppThemeExtension lerp(covariant ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;

    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    double d(double a, double b) => lerpDouble(a, b, t)!;

    return AppThemeExtension(
      primary: c(primary, other.primary),
      onPrimary: c(onPrimary, other.onPrimary),
      secondary: c(secondary, other.secondary),
      onSecondary: c(onSecondary, other.onSecondary),
      error: c(error, other.error),
      onError: c(onError, other.onError),
      surface: c(surface, other.surface),
      onSurface: c(onSurface, other.onSurface),
      onSurfaceSecondary: c(onSurfaceSecondary, other.onSurfaceSecondary),
      buttonBorderRadius: d(buttonBorderRadius, other.buttonBorderRadius),
      outlinedButtonBorderWidth: d(outlinedButtonBorderWidth, other.outlinedButtonBorderWidth),
      textFormFieldBorderRadius: d(textFormFieldBorderRadius, other.textFormFieldBorderRadius),
      textFormFieldBorderSide: d(textFormFieldBorderSide, other.textFormFieldBorderSide),
      textFormFieldFocusedBorderSideValue: d(textFormFieldFocusedBorderSideValue, other.textFormFieldFocusedBorderSideValue),
      buttonMinSizeHeight: d(buttonMinSizeHeight, other.buttonMinSizeHeight),
      textFormFieldFocusedBorderSideWidth: d(textFormFieldFocusedBorderSideWidth, other.textFormFieldFocusedBorderSideWidth),
      displayTextSmallColor: c(displayTextSmallColor, other.displayTextSmallColor),
      displayTextMediumColor: c(displayTextMediumColor, other.displayTextMediumColor),
      displayTextLargeColor: c(displayTextLargeColor, other.displayTextLargeColor),
      titleTextSmallColor: c(titleTextSmallColor, other.titleTextSmallColor),
      titleTextMediumColor: c(titleTextMediumColor, other.titleTextMediumColor),
      titleTextLargeColor: c(titleTextLargeColor, other.titleTextLargeColor),
      bodyTextSmallColor: c(bodyTextSmallColor, other.bodyTextSmallColor),
      bodyTextMediumColor: c(bodyTextMediumColor, other.bodyTextMediumColor),
      bodyTextLargeColor: c(bodyTextLargeColor, other.bodyTextLargeColor),
      headlineTextSmallColor: c(headlineTextSmallColor, other.headlineTextSmallColor),
      headlineTextMediumColor: c(headlineTextMediumColor, other.headlineTextMediumColor),
      headlineTextLargeColor: c(headlineTextLargeColor, other.headlineTextLargeColor),
      labelTextSmallColor: c(labelTextSmallColor, other.labelTextSmallColor),
      labelTextMediumColor: c(labelTextMediumColor, other.labelTextMediumColor),
      labelTextLargeColor: c(labelTextLargeColor, other.labelTextLargeColor),
      warningColor: c(warningColor, other.warningColor),
      infoColor: c(infoColor, other.infoColor),
      successColor: c(successColor, other.successColor),
    );
  }

  /// Returns a fixed-size dimension for buttons.
  Size get buttonMinSize => Size(double.infinity, buttonMinSizeHeight);

  /// Returns a rounded rectangle border shape based on current corner radius.
  RoundedRectangleBorder get roundedRectangleShape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonBorderRadius));
}
