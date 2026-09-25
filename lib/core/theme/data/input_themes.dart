import 'package:flutter/material.dart';

abstract class InputThemes {
  static final outlineInputDecoration = InputDecoration(
    labelStyle: _labelStyle,
    border: _border,
    enabledBorder: _border,
    focusedBorder: _border,
  );

  static final _border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5)),
    borderRadius: BorderRadius.circular(4),
  );

  static const TextStyle _labelStyle = TextStyle(color: Colors.grey);
}
