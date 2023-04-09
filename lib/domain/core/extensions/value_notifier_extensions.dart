import 'package:flutter/material.dart';

extension BoolValueNotifierExtensions on ValueNotifier<bool> {
  void toggle() => value = !value;
}
