import 'package:app/presentation/pages/pages.dart';
import 'package:app/presentation/routing/dashboard_tabs/form_routing.dart';
import 'package:app/presentation/routing/dashboard_tabs/home_routing.dart';
import 'package:app/presentation/routing/dashboard_tabs/more_routing.dart';
import 'package:app/presentation/routing/dashboard_tabs/spots_routing.dart';
import 'package:flutter/material.dart';

class Routing {
  static const String dashboard = 'dashboard';

  const Routing._();

  static bool canHandleRoute(String? routeName, String prefix) => routeName?.startsWith('$prefix/') ?? false;

  static Route? getRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    if (FormRouting.canHandleRoute(routeName)) {
      return FormRouting.getRoute(settings);
    } else if (HomeRouting.canHandleRoute(routeName)) {
      return HomeRouting.getRoute(settings);
    } else if (SpotsRouting.canHandleRoute(routeName)) {
      return SpotsRouting.getRoute(settings);
    } else if (MoreRouting.canHandleRoute(routeName)) {
      return MoreRouting.getRoute(settings);
    }

    final Widget? page = getPage(routeName);
    if (page == null) return null;
    return buildRoute(
      settings: settings,
      child: page,
    );
  }

  static Widget? getPage(String? routeName) {
    switch (routeName) {
      case dashboard:
        return Pages.dashboard();
      default:
        return null;
    }
  }

  static Route buildRoute({
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
