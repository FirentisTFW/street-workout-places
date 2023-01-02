import 'package:app/routing/routing.dart';
import 'package:flutter/material.dart';

class FormRouting {
  static const String _prefix = 'form';
  static const String form = _prefix;

  const FormRouting._();

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
      case form:
        // TODO Implement
        return const SizedBox.shrink();
      default:
        return null;
    }
  }

  static bool canHandleRoute(String? route) => Routing.canHandleRoute(route, _prefix);
}
