import 'package:flutter/material.dart';

import '../theme_extension.dart';

abstract class TabBarThemeData {
  static get(AppThemeExtension themeExt) {
    return TabBarTheme(
      dividerColor: themeExt.onSurface.withOpacity(0.2),
      dividerHeight: 0.5,
    );
  }
}
