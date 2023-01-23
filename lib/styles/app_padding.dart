import 'package:flutter/material.dart';

class AppPadding {
  const AppPadding._();

  static const double _defaultValue = 20.0;
  static const EdgeInsets defaultAll = EdgeInsets.all(_defaultValue);
  static const EdgeInsets defaultHorizontal = EdgeInsets.symmetric(
    horizontal: _defaultValue,
  );
}
