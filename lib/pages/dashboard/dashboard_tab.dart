import 'package:app/generated/l10n.dart';
import 'package:app/routing/dashboard_tabs/form_routing.dart';
import 'package:app/routing/dashboard_tabs/home_routing.dart';
import 'package:app/routing/dashboard_tabs/more_routing.dart';
import 'package:app/routing/dashboard_tabs/spots_routing.dart';
import 'package:flutter/material.dart';

enum DashboardTab {
  form(
    icon: Icons.add_circle_outline,
    initialRoute: FormRouting.form,
  ),
  home(
    icon: Icons.home,
    initialRoute: HomeRouting.home,
  ),
  more(
    icon: Icons.more_horiz,
    initialRoute: MoreRouting.more,
  ),
  spots(
    icon: Icons.map_outlined,
    initialRoute: SpotsRouting.spots,
  );

  const DashboardTab({
    required this.icon,
    required this.initialRoute,
  });

  final IconData icon;
  final String initialRoute;

  String getLabel(BuildContext context) {
    switch (this) {
      case DashboardTab.form:
        return S.of(context).dashboardTabForm;
      case DashboardTab.home:
        return S.of(context).dashboardTabHome;
      case DashboardTab.more:
        return S.of(context).dashboardTabMore;
      case DashboardTab.spots:
        return S.of(context).dashboardTabSpots;
    }
  }
}
