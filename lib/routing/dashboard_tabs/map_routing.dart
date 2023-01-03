import 'package:app/pages/pages.dart';
import 'package:app/routing/routing.dart';
import 'package:flutter/material.dart';

class MapRouting {
  static const String _prefix = 'map';
  static const String map = '$_prefix/main';

  const MapRouting._();

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
      case map:
        return Pages.map();
      default:
        return null;
    }
  }

  static bool canHandleRoute(String? route) => Routing.canHandleRoute(route, _prefix);
}
