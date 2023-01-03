import 'package:app/pages/pages.dart';
import 'package:app/routing/routing.dart';
import 'package:flutter/material.dart';

class HomeRouting {
  static const String _prefix = 'home';
  static const String home = '$_prefix/main';

  const HomeRouting._();

  static Route? getRoute(RouteSettings settings) {
    final Widget? page = getPage(settings.name);
    if (page == null) return null;
    return Routing.buildRoute(
      child: page,
      settings: settings,
    );
  }

  static Widget? getPage(String? routeName) {
    switch (routeName) {
      case home:
        return Pages.home();
      default:
        return null;
    }
  }

  static bool canHandleRoute(String? route) => Routing.canHandleRoute(route, _prefix);
}
