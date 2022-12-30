import 'package:app/pages/pages.dart';
import 'package:flutter/material.dart';

class Routing {
  static const String tabBar = 'tab_bar';

  const Routing._();

  static bool canHandleRoute(String? routeName, String prefix) => routeName?.startsWith('$prefix/') ?? false;

  static Route? getRoute(RouteSettings settings) {
    final Widget? page = getPage(settings.name);
    if (page == null) return null;
    return _buildRoute(
      settings: settings,
      child: page,
    );
  }

  static Widget? getPage(String? routeName) {
    switch (routeName) {
      case tabBar:
        return Pages.tabBar();
      default:
        return null;
    }
  }

  static Route _buildRoute({
    required RouteSettings settings,
    bool fullscreenDialog = false,
    required Widget child,
  }) =>
      MaterialPageRoute(
        builder: (_) => child,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
}
