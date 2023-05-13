import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/domain/core/common/maps/map_coordinator.dart';
import 'package:app/domain/core/common/query_controller.dart';
import 'package:app/domain/core/common/root_navigator.dart';
import 'package:app/domain/core/common/text_field_essentials.dart';
import 'package:app/domain/core/utils/alert_dialog_utils.dart';
import 'package:app/domain/models/page_tab_bar_button_data.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/domain/services/map_clusters_service.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/injector.dart';
import 'package:app/presentation/pages/map_clusters/map_clusters_cubit.dart';
import 'package:app/presentation/pages/spot_details/spot_details_arguments.dart';
import 'package:app/presentation/pages/spots/spots_page_tab.dart';
import 'package:app/presentation/pages/spots/widgets/spot_list.dart';
import 'package:app/presentation/routing/dashboard_tabs/spots_routing.dart';
import 'package:app/presentation/styles/app_animations.dart';
import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/widgets/app_text_field.dart';
import 'package:app/presentation/widgets/automatic_keep_alive_client_container.dart';
import 'package:app/presentation/widgets/error_view_big.dart';
import 'package:app/presentation/widgets/page_tab_bar/page_tab_bar.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:app/presentation/widgets/spots_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpotsPage extends StatefulWidget {
  const SpotsPage({
    super.key,
  });

  @override
  State<SpotsPage> createState() => _SpotsPageState();
}

class _SpotsPageState extends BlocPageState<SpotsPage, SpotsCubit> {
  final PageController _pageController = PageController();
  final QueryController _queryController = QueryController.withDefaultDuration();
  final TextFieldEssentials _searchTFE = TextFieldEssentials.noValidation();
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
    _queryController.dispose();
    super.dispose();
  }

  void _fetchSpots() {
    spotsCubit.fetchSpots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingActionButtons(),
      body: SafeArea(
        child: BlocProvider<MapClustersCubit>(
          create: (_) => MapClustersCubit(
            mapClustersService: Injector().resolve<MapClustersService>(),
            mapCoordinator: MapCoordinator.create(),
            spotsCubit: spotsCubit,
          ),
          child: BlocBuilder<SpotsCubit, SpotsState>(
            builder: (_, state) => switch (state) {
              final SpotsFetchInProgress _ => buildLoadingBody(),
              final SpotsFetchSuccess state => _buildLoadedBody(state.spots),
              final SpotsFetchFailure state => ErrorViewBig(
                  error: state.error,
                  onRetryPressed: _fetchSpots,
                ),
              _ => buildEmptyBody()
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButtons() {
    const iconSize = 30.0;

    return Padding(
      padding: EdgeInsets.only(
        bottom: AppDimensions.height.bottomNavgationBar + 30.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              // TODO Implement
              AlertDialogUtils.showContentUnavailable(context);
            },
            child: const Icon(
              Icons.gps_fixed,
              size: iconSize,
            ),
          ),
          const Space.vertical(10.0),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              // TODO Implement
              AlertDialogUtils.showContentUnavailable(context);
            },
            child: const Icon(
              Icons.filter_alt,
              size: iconSize,
            ),
          ),
        ],
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
    return Padding(
      padding: AppPadding.defaultHorizontal,
      child: AppTextField(
        _searchTFE,
        labelText: S.of(context).search,
        textInputAction: TextInputAction.done,
        onTextChanged: (text) => _queryController.updateQuery(
          text,
          action: filterSpots,
        ),
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
      child: BlocBuilder<MapClustersCubit, MapClustersState>(
        builder: (_, state) => SpotsMap(
          clusters: state.clusters,
          onSpotIconPressed: _goToSpotDetails,
        ),
      ),
    );
  }

  Widget _buildSpotList(List<WorkoutSpotModel> spots) {
    return SpotList(
      spots: spots,
      onSpotPressed: _goToSpotDetails,
    );
  }

  void filterSpots() {
    bloc.filterSpotsByQuery(_searchTFE.text);
  }

  void _goToSpotDetails(WorkoutSpotModel spot) => RootNavigator.of(context).pushNamed(
        SpotsRouting.spotDetails,
        arguments: SpotDetailsArguments(
          spot: spot,
        ),
      );
}
