import 'package:app/generated/l10n.dart';
import 'package:app/presentation/routing/dashboard_tabs/form_routing.dart';
import 'package:app/presentation/routing/dashboard_tabs/home_routing.dart';
import 'package:app/presentation/routing/dashboard_tabs/more_routing.dart';
import 'package:app/presentation/routing/dashboard_tabs/spots_routing.dart';
import 'package:flutter/material.dart';

enum DashboardTab {
  form(
    icon: Icons.add_circle_outline,
    initialRoute: FormRouting.start,
  ),
  home(
    icon: Icons.home_outlined,
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

  String getLabel(S s) {
    switch (this) {
      case DashboardTab.form:
        return s.dashboardTabForm;
      case DashboardTab.home:
        return s.dashboardTabHome;
      case DashboardTab.more:
        return s.dashboardTabMore;
      case DashboardTab.spots:
        return s.dashboardTabSpots;
    }
  }
}
