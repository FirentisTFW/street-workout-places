import 'package:app/presentation/pages/pages.dart';
import 'package:app/presentation/routing/routing.dart';
import 'package:flutter/material.dart';

class FormRouting {
  static const String _prefix = 'form';
  static const String equipment = '$_prefix/equipment';
  static const String form = '$_prefix/main';
  static const String start = '$_prefix/start';

  const FormRouting._();

  static Route? getRoute(RouteSettings settings) {
    final Widget? page = getPage(settings);
    if (page == null) return null;
    return Routing.buildRoute(
      child: page,
      settings: settings,
    );
  }

  static Widget? getPage(RouteSettings settings) {
    switch (settings.name) {
      case equipment:
        return Pages.newSpotEquipment(settings.arguments);
      case form:
        return Pages.newSpotForm();
      case start:
        return Pages.newSpotInitial();
      default:
        return null;
    }
  }

  static bool canHandleRoute(String? route) => Routing.canHandleRoute(route, _prefix);
}
