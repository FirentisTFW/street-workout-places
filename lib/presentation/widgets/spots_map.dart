import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:app/application/blocs/spots/spots_presentation_event.dart';
import 'package:app/domain/core/common/constants.dart';
import 'package:app/domain/core/common/controllers/delayed_replacable_action_controller.dart';
import 'package:app/domain/core/common/global_blocs_mixin.dart';
import 'package:app/domain/core/common/root_navigator.dart';
import 'package:app/domain/core/utils/animated_interpolation.dart';
import 'package:app/domain/models/map_cluster_model.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/domain/models/zoom.dart';
import 'package:app/presentation/pages/map_clusters/map_clusters_cubit.dart';
import 'package:app/presentation/pages/spot_details/spot_details_arguments.dart';
import 'package:app/presentation/routing/dashboard_tabs/spots_routing.dart';
import 'package:app/presentation/styles/app_animations.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpotsMap extends StatefulWidget {
  final List<MapClusterModel> clusters;
  final void Function(WorkoutSpotModel) onSpotIconPressed;

  const SpotsMap({
    required this.clusters,
    required this.onSpotIconPressed,
  });

  @override
  State<SpotsMap> createState() => _SpotsMapState();
}

class _SpotsMapState extends State<SpotsMap> with GlobalBlocsMixin, SingleTickerProviderStateMixin {
  final DelayedReplacableActionController _maPositionReationController =
      DelayedReplacableActionController.withDefaultDuration();
  late final AnimationController _cameraZoomAnimationController;

  AnimatedInterpolation<double>? _cameraZoomInterpolation;

  MapClustersCubit get _mapClustersCubit => BlocProvider.of<MapClustersCubit>(context);

  @override
  void initState() {
    super.initState();
    _cameraZoomAnimationController = AnimationController(
      vsync: this,
      duration: AppAnimations.regularDuration,
    );
  }

  @override
  void dispose() {
    _maPositionReationController.dispose();
    _cameraZoomInterpolation?.cancel();
    _cameraZoomAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocPresentationListener<SpotsCubit>(
      listener: _onPresentationEvent,
      child: _mapClustersCubit.mapCoordinator.buildMapWithSpots(
        context,
        clusters: widget.clusters,
        mapEssentials: Constants.maps.essentials,
        onMapReady: _updateMapClusters,
        onPositionChanged: () => _maPositionReationController.replaceAction(_updateMapClusters),
        onClusterPressed: _zoomIntoCluster,
        onSpotPressed: _goToSpotDetails,
      ),
    );
  }

  void _onPresentationEvent(BuildContext context, BlocPresentationEvent event) {
    if (event is SortingSpotsInProgress) {
      _mapClustersCubit.moveAndZoomMapToUserPosition();
    }
  }

  void _updateMapClusters() {
    final SpotsState spotsState = spotsCubit.state;
    if (spotsState is SpotsFetchSuccess) {
      _mapClustersCubit.updateClusters(
        spots: spotsState.filteredSpots,
      );
    }
  }

  void _zoomIntoCluster(MapClusterModel cluster) {
    _cameraZoomInterpolation?.cancel();

    _cameraZoomAnimationController
      ..value = 0
      ..animateTo(1, curve: Curves.easeInOut);

    final currentZoom = _mapClustersCubit.mapCoordinator.zoom;

    _cameraZoomInterpolation = AnimatedInterpolation<double>(
      animation: _cameraZoomAnimationController,
      startValue: currentZoom,
      endValue: currentZoom + Constants.maps.defaultZoomIncrementation,
      interpolate: (start, end, value) => start + (end - start) * value,
      action: (zoom) => _mapClustersCubit.mapCoordinator.zoomToPosition(
        position: cluster.coordinates,
        zoom: ZoomDirect(zoom),
      ),
      onCompleted: () => _cameraZoomInterpolation = null,
    );
  }

  void _goToSpotDetails(WorkoutSpotModel spot) => RootNavigator.of(context).pushNamed(
        SpotsRouting.spotDetails,
        arguments: SpotDetailsArguments(
          spot: spot,
        ),
      );
}
