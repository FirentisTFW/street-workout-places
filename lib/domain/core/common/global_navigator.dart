import 'package:flutter/material.dart';

class GlobalNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get currentState => navigatorKey.currentState;

  BuildContext? get currentContext => navigatorKey.currentState?.overlay?.context;
}
