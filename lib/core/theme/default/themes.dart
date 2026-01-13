// smart_lib_theme/core/theme/default/app_default_themes_data.dart

import 'package:flutter/material.dart';
import 'package:smart_lib_theme/core/theme/extensions/theme_extension.dart';

import '../data/app_bar.dart';
import '../data/button.dart';
import '../data/color_scheme.dart';
import '../data/dialog.dart';
import '../data/floating_action_button.dart';
import '../data/navigation_bar.dart';
import '../data/progress_indicator.dart';
import '../data/tab_bar.dart' as tab_bar;
import '../data/text.dart';
import 'default_theme_extensions.dart';

/// A utility class that provides pre-configured light and dark themes for the application.
///
/// This class uses [ThemeData] to construct complete theme definitions by combining:
/// - Color schemes
/// - Button styles
/// - Text themes
/// - Component-specific themes (e.g., AppBar, Dialog, TabBar)
///
/// It relies on [DefaultLightThemeExtension] and [DefaultDarkThemeExtension] for base design tokens [[6]].
class AppDefaultThemesData {
  /// Returns a fully configured light theme using [DefaultLightThemeExtension].
  ThemeData get light => _def(themeExt: DefaultLightThemeExtension(), brightness: Brightness.light);

  /// Returns a fully configured dark theme using [DefaultDarkThemeExtension].
  ThemeData get dark => _def(themeExt: DefaultDarkThemeExtension(), brightness: Brightness.dark);

  /// Constructs and returns a [ThemeData] object based on provided extension and brightness.
  ///
  /// This method centralizes the creation logic for all app themes. It composes various theme components
  /// like buttons, text, navigation bars, etc., using their respective theming data classes.
  ///
  /// Parameters:
  /// - [themeExt]: The theme extension containing base color and shape tokens [[6]]
  /// - [brightness]: The overall brightness (light or dark) of the theme
  ///
  /// Returns a ready-to-use [ThemeData] object suitable for use in [MaterialApp]
  ThemeData _def({required AppThemeExtension themeExt, required Brightness brightness}) {
    return ThemeData(
      // fontFamily: FontFamily.adriana,
      extensions: [themeExt],
      colorScheme: ColorSchemeThemeData.get(themeExt, brightness: brightness),
      elevatedButtonTheme: ButtonThemesData.elevated(themeExt),
      outlinedButtonTheme: ButtonThemesData.outlined(themeExt),
      textTheme: TextThemesData.get(themeExt),
      // inputDecorationTheme: InputThemesData.outline(themeExt),
      appBarTheme: AppBarThemesData.get(themeExt),
      dialogTheme: DialogThemesData.get(themeExt),
      floatingActionButtonTheme: FloatingActionButtonThemesData.get(themeExt),
      progressIndicatorTheme: ProgressIndicatorThemesData.get(themeExt),
      navigationBarTheme: NavigationBarThemesData.get(themeExt),
      // dividerTheme: DividerThemesData.get(themeExt),
      tabBarTheme: tab_bar.TabBarThemesData.get(themeExt),
    );
  }
}