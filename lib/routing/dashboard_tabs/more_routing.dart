import 'package:app/pages/pages.dart';
import 'package:app/routing/routing.dart';
import 'package:flutter/material.dart';

class MoreRouting {
  static const String _prefix = 'more';
  static const String more = '$_prefix/main';

  const MoreRouting._();

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
      case more:
        return Pages.more();
      default:
        return null;
    }
  }

  static bool canHandleRoute(String? route) => Routing.canHandleRoute(route, _prefix);
}
