import 'package:flutter/material.dart';

abstract class RootNavigator {
  const RootNavigator._();

  static NavigatorState of(BuildContext context) => Navigator.of(
        context,
        rootNavigator: true,
      );
}
