import 'package:flutter/material.dart';

import '../theme_extension.dart';

abstract class DividerThemesData {
  static DividerThemeData get(
    AppThemeExtension themeExt,
  ) {
    return DividerThemeData(
      color:  themeExt.bodyTextSmallColor.withOpacity(0.3),
      thickness: 0.5,
      indent: 16,
      endIndent: 16,
    );
  }
}
