import 'package:app/pages/pages.dart';
import 'package:app/routing/routing.dart';
import 'package:flutter/material.dart';

class SpotsRouting {
  static const String _prefix = 'spots';
  static const String spots = '$_prefix/main';

  const SpotsRouting._();

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
      case spots:
        return Pages.spots();
      default:
        return null;
    }
  }

  static bool canHandleRoute(String? route) => Routing.canHandleRoute(route, _prefix);
}
