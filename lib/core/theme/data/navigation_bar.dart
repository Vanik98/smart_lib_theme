import 'package:flutter/material.dart';

import '../extensions/theme_extension.dart';

abstract class NavigationBarThemesData {
  static NavigationBarThemeData get(AppThemeExtension themeExt) {
    return NavigationBarThemeData(
      backgroundColor: themeExt.surface,
      indicatorColor: themeExt.primary,
      labelPadding: EdgeInsets.zero,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        return TextStyle(
          color: states.contains(WidgetState.selected) ? themeExt.primary : themeExt.bodyTextSmallColor,
          overflow: TextOverflow.ellipsis,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        );
      }),
      iconTheme: WidgetStatePropertyAll(IconThemeData(color: themeExt.onSurface)),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      surfaceTintColor: Colors.transparent,
    );
  }
}
