import 'package:flutter/material.dart';

import '../extensions/theme_extension.dart';

abstract class DialogThemesData {
  static DialogThemeData get(AppThemeExtension themeExt) {
    return DialogThemeData(
      backgroundColor: themeExt.surface,
      titleTextStyle: TextStyle(
        color: themeExt.primary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
