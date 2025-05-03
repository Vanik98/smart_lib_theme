import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  static const _buttonCornerRadiusValue = 8.0;
  static const _outlinedButtonBorderWidthValue = 1.0;
  static const _textFormFieldBorderRadiusValue = 8.0;
  static const _textFormFieldBorderSideValue = 1.0;
  static const _textFormFieldFocusedBorderSideValue = 2.0;
  static const _buttonMinSizeHeightValue = 40.0;
  static const _textFormFieldFocusedBorderSideWidthValue = 2.0;

  static double get buttonMinSizeHeightValue => _buttonMinSizeHeightValue;

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color surface;
  final Color onSurface;
  final Color onSurfaceSecondary;
  final Color appBarColor;
  final Color gradientColor1;
  final Color gradientColor2;

  final Color warningColor;
  final Color infoColor;
  final Color successColor;

  final double buttonBorderRadius;
  final double outlinedButtonBorderWidth;
  final double buttonMinSizeHeight;

  final double textFormFieldBorderRadius;
  final double textFormFieldBorderSide;
  final double textFormFieldFocusedBorderSideValue;
  final double textFormFieldFocusedBorderSideWidth;

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
    required this.appBarColor,
    required this.gradientColor1,
    required this.gradientColor2,
  });

  @override
  ThemeExtension<AppThemeExtension> copyWith() => this;

  @override
  ThemeExtension<AppThemeExtension> lerp(covariant ThemeExtension<AppThemeExtension>? other, double t) => this;

  Size get buttonMinSize => Size(double.infinity, buttonMinSizeHeight);

  RoundedRectangleBorder get roundedRectangleShape => RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonBorderRadius));
}

class LightThemeExtension extends AppThemeExtension {
  LightThemeExtension()
      : super(
          primary: Colors.blue,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.blue,
          error: Colors.red,
          onError: Colors.red.shade300,
          surface:  Colors.white,
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
          appBarColor: Colors.blue,
          gradientColor1: Colors.blue.shade300,
          gradientColor2: Colors.blue,
        );
}

class DarkThemeExtension extends AppThemeExtension {
  DarkThemeExtension()
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
          appBarColor: Colors.blue.shade900,
          gradientColor1: Colors.grey.shade700,
          gradientColor2: Colors.blue.shade900,
        );
}

class AppThemeExtensionV2 extends ThemeExtension<AppThemeExtensionV2> {
  @override
  ThemeExtension<AppThemeExtensionV2> copyWith() => this;

  @override
  ThemeExtension<AppThemeExtensionV2> lerp(covariant ThemeExtension<AppThemeExtensionV2>? other, double t) => this;
}
