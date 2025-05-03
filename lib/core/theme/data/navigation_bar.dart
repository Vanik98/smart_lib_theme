import 'package:flutter/material.dart';

import '../theme_extension.dart';

abstract class NavigationBarThemesData {
  static get(AppThemeExtension themeExt) {
    return NavigationBarThemeData(
      backgroundColor: themeExt.surface,
      indicatorColor: themeExt.primary,
      labelPadding:EdgeInsets.zero,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? TextStyle(color: themeExt.primary, overflow: TextOverflow.ellipsis, fontSize: 10, fontWeight: FontWeight.bold)
            : TextStyle(color: themeExt.bodyTextSmallColor, overflow: TextOverflow.ellipsis, fontSize: 10, fontWeight: FontWeight.bold);
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected) ? IconThemeData(color: themeExt.onSurface) : IconThemeData(color: themeExt.onSurface);
      }),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      surfaceTintColor: Colors.transparent,
    );
  }
}
