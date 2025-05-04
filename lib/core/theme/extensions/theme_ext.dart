import 'package:flutter/material.dart';
import 'package:smart_lib_theme/core/theme/extensions/theme_extension.dart';

import '../default/default_theme_extensions.dart';

extension ThemeExt on BuildContext {
  AppThemeExtension appColors() => Theme.of(this).extension<AppThemeExtension>() ?? DefaultLightThemeExtension();

  ColorScheme colorScheme() => Theme.of(this).colorScheme;

  TextTheme textTheme() => Theme.of(this).textTheme;

  TextStyle? displaySmallBold() => textTheme().displaySmall?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? displayMediumBold() => textTheme().displayMedium?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? displayLargeBold() => textTheme().displayLarge?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? titleSmallBold() => textTheme().titleSmall?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? titleMediumBold() => textTheme().titleMedium?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? titleLargeBold() => textTheme().titleLarge?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? bodySmallBold() => textTheme().bodySmall?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? bodyMediumBold() => textTheme().bodyMedium?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? bodyLargeBold() => textTheme().bodyLarge?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? labelSmallBold() => textTheme().labelSmall?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? labelMediumBold() => textTheme().labelMedium?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? labelLargeBold() => textTheme().labelLarge?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? headlineSmallBold() => textTheme().headlineSmall?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, fontSize: 16);

  TextStyle? headlineMediumBold() => textTheme().headlineMedium?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);

  TextStyle? headlineLargeBold() => textTheme().headlineLarge?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);
}
