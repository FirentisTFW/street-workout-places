import 'package:app/generated/l10n.dart';
import 'package:app/routing/dashboard_tabs/form_routing.dart';
import 'package:app/routing/dashboard_tabs/home_routing.dart';
import 'package:app/routing/dashboard_tabs/map_routing.dart';
import 'package:app/routing/dashboard_tabs/more_routing.dart';
import 'package:flutter/material.dart';

enum DashboardTab {
  form,
  home,
  map,
  more;

  IconData get icon {
    // TODO Return proper icons
    return Icons.home;
  }

  String get initialRoute {
    switch (this) {
      case DashboardTab.form:
        return FormRouting.form;
      case DashboardTab.more:
        return MoreRouting.more;
      case DashboardTab.home:
        return HomeRouting.home;
      case DashboardTab.map:
        return MapRouting.map;
    }
  }

  String getLabel(BuildContext context) {
    switch (this) {
      case DashboardTab.form:
        return S.of(context).dashboardTabForm;
      case DashboardTab.more:
        return S.of(context).dashboardTabMore;
      case DashboardTab.home:
        return S.of(context).dashboardTabHome;
      case DashboardTab.map:
        return S.of(context).dashboardTabMap;
    }
  }
}
