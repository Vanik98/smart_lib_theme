import 'package:flutter/material.dart';

import '../extensions/theme_extension.dart';

abstract class TabBarThemesData {
  static TabBarThemeData get(AppThemeExtension themeExt) {
    return TabBarThemeData(
      dividerColor: themeExt.onSurface.withValues(alpha: 0.2),
      dividerHeight: 0.5,
    );
  }
}
