import 'package:app/blocs/spots/spots_bloc.dart';
import 'package:app/common/bloc_page_state.dart';
import 'package:app/common/root_navigator.dart';
import 'package:app/common/text_field_essentials.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/page_tab_bar_button_data.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/pages/spot_details/spot_details_arguments.dart';
import 'package:app/pages/spots/spots_page_tab.dart';
import 'package:app/pages/spots/widgets/spot_list.dart';
import 'package:app/routing/dashboard_tabs/spots_routing.dart';
import 'package:app/styles/app_animations.dart';
import 'package:app/styles/app_padding.dart';
import 'package:app/widgets/app_text_field.dart';
import 'package:app/widgets/automatic_keep_alive_client_container.dart';
import 'package:app/widgets/page_tab_bar/page_tab_bar.dart';
import 'package:app/widgets/space.dart';
import 'package:app/widgets/spots_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpotsPage extends StatefulWidget {
  const SpotsPage({
    super.key,
  });

  @override
  State<SpotsPage> createState() => _SpotsPageState();
}

class _SpotsPageState extends BlocPageState<SpotsPage, SpotsBloc> {
  final PageController _pageController = PageController();
  final TextFieldEssentials _searchTFE = TextFieldEssentials();
  final ValueNotifier<SpotsPageTab> _tabNotifier = ValueNotifier(SpotsPageTab.map);

  @override
  void initState() {
    super.initState();
    _tabNotifier.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    _pageController.animateToPage(
      _tabNotifier.value.tabBarButtonIndex,
      curve: Curves.easeIn,
      duration: AppAnimations.regularDuration,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabNotifier.dispose();
    _searchTFE.dispose();
    super.dispose();
  }

  void _fetchSpots() {
    spotsBloc.add(
      const SpotsEvent.fetchSpotsRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SpotsBloc, SpotsState>(
          builder: (_, state) => state.maybeWhen(
            fetchSpotsInProgress: buildLoadingBody,
            fetchSpotsSuccess: _buildLoadedBody,
            fetchSpotsFailure: (error) => buildFullPageErrorBody(
              error,
              onRetryPressed: _fetchSpots,
            ),
            orElse: buildEmptyBody,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedBody(List<WorkoutSpotModel> spots) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Column(
        children: [
          _buildSearchBar(),
          const Space.vertical(30.0),
          _buildTabBar(),
          const Space.vertical(20.0),
          Expanded(
            child: _buildPageView(spots),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    // TODO Implement onChange - filter locations by name
    return Padding(
      padding: AppPadding.defaultHorizontal,
      child: AppTextField(
        _searchTFE,
        labelText: S.of(context).search,
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: AppPadding.defaultHorizontal,
      child: ValueListenableBuilder<SpotsPageTab>(
        valueListenable: _tabNotifier,
        builder: (context, selectedTab, _) {
          return PageTabBar(
            buttonsData: [
              PageTabBarButtonData(
                title: S.of(context).spotsMapTabBarButtonTitle,
                onPressed: () => _tabNotifier.value = SpotsPageTab.map,
              ),
              PageTabBarButtonData(
                title: S.of(context).spotsListTabBarButtonTitle,
                onPressed: () => _tabNotifier.value = SpotsPageTab.list,
              ),
            ],
            selectedButtonIndex: selectedTab.tabBarButtonIndex,
          );
        },
      ),
    );
  }

  Widget _buildPageView(List<WorkoutSpotModel> spots) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildMap(spots),
        _buildSpotList(spots),
      ],
    );
  }

  Widget _buildMap(List<WorkoutSpotModel> spots) {
    return AutomaticKeepAliveClientContainer(
      child: SpotsMap(
        spots: spots,
        onSpotIconPressed: _goToSpotDetails,
      ),
    );
  }

  Widget _buildSpotList(List<WorkoutSpotModel> spots) {
    return SpotList(
      spots: spots,
      onSpotPressed: _goToSpotDetails,
    );
  }

  void _goToSpotDetails(WorkoutSpotModel spot) => RootNavigator.of(context).pushNamed(
        SpotsRouting.spotDetails,
        arguments: SpotDetailsArguments(
          spot: spot,
        ),
      );
}
