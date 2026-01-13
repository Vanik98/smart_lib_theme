import 'package:flutter/material.dart';

import '../extensions/theme_extension.dart';

abstract class DialogThemesData {
  static get(AppThemeExtension themeExt) {
    return DialogThemeData(
        backgroundColor: themeExt.surface,
        titleTextStyle: TextStyle(
          color: themeExt.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ));
  }
}

// abstract class DialogThemes {
//   static final dialogThemeDataLight = DialogTheme(
//     backgroundColor: AppColors.white,
//     titleTextStyle: _titleTextStyle,
//     contentTextStyle: _contentTextStyle,
//     shape: _shape,
//     surfaceTintColor: Colors.transparent,
//   );
//
//   static final _contentTextStyle = TextStyle(
//     color: AppColors.charcoalGrey.withOpacity(0.6),
//     fontSize: 16,
//   );
//
//   static final _shape = RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(16),
//   );
// }
