import 'package:flutter/material.dart';

import '../extensions/theme_extension.dart';

abstract class TabBarThemesData {
  static get(AppThemeExtension themeExt) {
    return TabBarThemeData(
      dividerColor: themeExt.onSurface.withOpacity(0.2),
      dividerHeight: 0.5,
    );
  }
}
