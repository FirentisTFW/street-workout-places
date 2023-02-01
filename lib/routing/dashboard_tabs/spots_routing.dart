// ignore_for_file: cast_nullable_to_non_nullable

import 'package:app/pages/pages.dart';
import 'package:app/pages/spot_details/spot_details_arguments.dart';
import 'package:app/routing/routing.dart';
import 'package:flutter/material.dart';

class SpotsRouting {
  static const String _prefix = 'spots';
  static const String spotDetails = '$_prefix/spot_details';
  static const String spots = '$_prefix/main';

  const SpotsRouting._();

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
      case spotDetails:
        return Pages.spotDetails(settings.arguments as SpotDetailsArguments);
      case spots:
        return Pages.spots();
      default:
        return null;
    }
  }

  static bool canHandleRoute(String? route) => Routing.canHandleRoute(route, _prefix);
}
