import 'package:app/common/bloc_page_state.dart';
import 'package:app/pages/dashboard/dashboard_bloc.dart';
import 'package:app/pages/dashboard/dashboard_tab.dart';
import 'package:app/routing/dashboard_tabs/form_routing.dart';
import 'package:app/routing/dashboard_tabs/home_routing.dart';
import 'package:app/routing/dashboard_tabs/map_routing.dart';
import 'package:app/routing/dashboard_tabs/more_routing.dart';
import 'package:app/styles/app_animations.dart';
import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends BlocPageState<DashboardPage, DashboardBloc> {
  static const List<DashboardTab> _tabs = [
    DashboardTab.home,
    DashboardTab.map,
    DashboardTab.form,
    DashboardTab.more,
  ];

  final Map<DashboardTab, GlobalKey<NavigatorState>> _tabsNavigatorsKeys = {
    for (final DashboardTab tab in _tabs) tab: GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: _onStateChanged,
      builder: (_, state) => Scaffold(
        body: _buildBody(state),
        bottomNavigationBar: _buildBottomNavigationBar(
          activeTab: state.tab,
        ),
      ),
    );
  }

  Future<void> _onStateChanged(BuildContext context, DashboardState state) async {
    state.whenOrNull(
      popTabToRoot: _popToRoot,
    );
  }

  void _popToRoot(DashboardTab tab) {
    final NavigatorState? navigatorState = _tabsNavigatorsKeys[tab]?.currentState;
    if (navigatorState?.canPop() ?? false) {
      navigatorState?.popUntil((route) => route.settings.name == tab.initialRoute);
    }
  }

  Widget _buildBody(DashboardState state) {
    return AnimatedSwitcher(
      duration: AppAnimations.animatedSwitcherDuration,
      child: Stack(
        children: [
          _buildPage(
            state,
            onGenerateRoute: HomeRouting.getRoute,
            tab: DashboardTab.home,
          ),
          _buildPage(
            state,
            onGenerateRoute: MapRouting.getRoute,
            tab: DashboardTab.map,
          ),
          _buildPage(
            state,
            onGenerateRoute: FormRouting.getRoute,
            tab: DashboardTab.form,
          ),
          _buildPage(
            state,
            onGenerateRoute: MoreRouting.getRoute,
            tab: DashboardTab.more,
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
    DashboardState state, {
    required RouteFactory onGenerateRoute,
    required DashboardTab tab,
  }) {
    return Offstage(
      offstage: tab != state.tab,
      child: WillPopScope(
        onWillPop: () async {
          if (await _tabsNavigatorsKeys[state.tab]?.currentState?.maybePop() ?? false) {
            return Future.value(false);
          } else if (state.tab != DashboardTab.home) {
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Navigator(
          key: _tabsNavigatorsKeys[tab],
          initialRoute: tab.initialRoute,
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar({
    required DashboardTab activeTab,
  }) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      currentIndex: _tabs.indexOf(activeTab),
      elevation: 2.0,
      items: _buildBottomNavigationBarItems(),
      onTap: (index) => bloc.add(
        DashboardEvent.changeTabRequested(
          tab: _tabs[index],
        ),
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return _tabs
        .map(
          (tab) => BottomNavigationBarItem(
            activeIcon: Icon(
              tab.icon,
              color: AppColors.blue,
            ),
            icon: Icon(
              tab.icon,
              color: AppColors.black,
            ),
            label: tab.getLabel(context),
          ),
        )
        .toList();
  }
}
