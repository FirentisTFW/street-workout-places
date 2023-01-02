import 'package:app/routing/routing.dart';
import 'package:flutter/material.dart';

class HomeRouting {
  static const String _prefix = 'home';
  static const String home = _prefix;

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
        // TODO Implement
        return const SizedBox.shrink();
      default:
        return null;
    }
  }

  static bool canHandleRoute(String? route) => Routing.canHandleRoute(route, _prefix);
}
