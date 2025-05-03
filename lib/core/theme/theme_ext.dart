import 'package:flutter/material.dart';
import 'package:smart_lib_theme/core/theme/theme_extension.dart';

extension ThemeExt on BuildContext {
  AppThemeExtension get themeExt => Theme.of(this).extension<AppThemeExtension>() ?? LightThemeExtension();
}