import 'package:flutter/material.dart';

abstract class InputThemes {
  // static const inputDecorationTheme = InputDecorationTheme(
  //   labelStyle: _labelStyle,
  //   border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.charcoalGrey)),
  //   focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.charcoalGrey)),
  //   enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.charcoalGrey)),
  // );

  static final outlineInputDecoration = InputDecoration(
    labelStyle: _labelStyle,
    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)), borderRadius: BorderRadius.circular(4)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)), borderRadius: BorderRadius.circular(4)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1), borderRadius: BorderRadius.circular(4)),
  );

  static const TextStyle _labelStyle = TextStyle(color: Colors.grey);
}
