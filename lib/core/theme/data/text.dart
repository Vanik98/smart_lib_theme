import 'package:flutter/material.dart';

import '../extensions/theme_extension.dart';

abstract class TextThemesData {
  /// Display Text
  static TextStyle displaySmall(AppThemeExtension themeExt) => TextStyle(color: themeExt.displayTextSmallColor);

  static TextStyle displayMedium(AppThemeExtension themeExt) => TextStyle(color: themeExt.displayTextMediumColor);

  static TextStyle displayLarge(AppThemeExtension themeExt) => TextStyle(color: themeExt.displayTextLargeColor);

  /// Title Text
  static TextStyle titleSmall(AppThemeExtension themeExt) => TextStyle(color: themeExt.titleTextSmallColor);

  static TextStyle titleMedium(AppThemeExtension themeExt) => TextStyle(color: themeExt.titleTextMediumColor);

  static TextStyle titleLarge(AppThemeExtension themeExt) => TextStyle(color: themeExt.titleTextLargeColor);

  /// Body Text
  static TextStyle bodySmall(AppThemeExtension themeExt) => TextStyle(color: themeExt.bodyTextSmallColor);

  static TextStyle bodyMedium(AppThemeExtension themeExt) => TextStyle(color: themeExt.bodyTextMediumColor);

  static TextStyle bodyLarge(AppThemeExtension themeExt) => TextStyle(color: themeExt.bodyTextLargeColor);

  /// Headline Text
  static TextStyle headlineSmall(AppThemeExtension themeExt) => TextStyle(color: themeExt.headlineTextSmallColor);

  static TextStyle headlineMedium(AppThemeExtension themeExt) => TextStyle(color: themeExt.headlineTextMediumColor);

  static TextStyle headlineLarge(AppThemeExtension themeExt) => TextStyle(color: themeExt.headlineTextLargeColor);

  /// Label Text
  static TextStyle labelSmall(AppThemeExtension themeExt) => TextStyle(color: themeExt.labelTextSmallColor);

  static TextStyle labelMedium(AppThemeExtension themeExt) => TextStyle(color: themeExt.labelTextMediumColor);

  static TextStyle labelLarge(AppThemeExtension themeExt) => TextStyle(color: themeExt.labelTextLargeColor);

  static TextTheme get(AppThemeExtension themeExt) {
    return TextTheme(
      /// Display styles (display1 to display4 in Flutter versions prior to 2.0, and headline1 to headline4 in later versions) are the largest text styles.
      /// They are intended for short, one or two-word statements at most, typically used for large numbers or as a big, impactful header.
      /// Example: You might use headline1 for the main title in a dashboard.
      displaySmall: displaySmall(themeExt),
      displayMedium: displayMedium(themeExt),
      displayLarge: displayLarge(themeExt),
      /// Title styles (title in older versions, and headline6 in later versions) are designed for medium-length text that's slightly less prominent than the display/headline text.
      /// They can be used for titles of content sections or for the app bar title.
      /// Example: headline6 might be used for the titles of list items in a navigation drawer.
      titleSmall: titleSmall(themeExt),
      titleMedium: titleMedium(themeExt),
      titleLarge: titleLarge(themeExt),
      /// Body styles (body1 and body2 in older versions, and bodyText1 and bodyText2 in later versions) are the base styles for paragraphs of text.
      /// They are meant to be the default styles for text that is not a title or a headline.
      /// Example: bodyText1 can be used for the main content of a typical paragraph.
      bodySmall: bodySmall(themeExt),
      bodyMedium: bodyMedium(themeExt),
      bodyLarge: bodyLarge(themeExt),
      /// In the updated ThemeData from Flutter 2.0 onwards, what were previously referred to as display styles are now part of the headline group (headline1 to headline6).
      /// These styles descend in size and are used for titles and large text.
      /// Example: headline5 may be used for the title of a screen in the app.
      headlineSmall: headlineSmall(themeExt),
      headlineMedium: headlineMedium(themeExt),
      headlineLarge: headlineLarge(themeExt),
      /// Label styles are not explicitly defined in Flutter's text theme3 but the caption style can often serve a similar purpose.
      /// Caption is usually used for text that is much smaller than the body text, like labels for icons or instructions in a form.
      labelSmall: labelSmall(themeExt),
      labelMedium: labelMedium(themeExt),
      labelLarge: labelLarge(themeExt),
    );
  }
}
