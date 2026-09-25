import 'package:flutter/material.dart';

import '../extensions/theme_extension.dart';

abstract class ProgressIndicatorThemesData {
  static ProgressIndicatorThemeData get(AppThemeExtension themeExt) {
    return ProgressIndicatorThemeData(
      color: themeExt.primary,
      linearTrackColor: Colors.transparent,
    );
  }
}
