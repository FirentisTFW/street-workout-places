import 'package:app/domain/core/common/constants.dart';
import 'package:app/domain/core/common/maps/map_coordinator.dart';
import 'package:app/domain/core/common/root_navigator.dart';
import 'package:app/domain/core/mappers/mappers.dart';
import 'package:app/domain/models/map_essentials.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/presentation/pages/home/widgets/spots_closest_to_user/cubit/spots_closest_to_user_cubit.dart';
import 'package:app/presentation/pages/spot_details/spot_details_arguments.dart';
import 'package:app/presentation/routing/dashboard_tabs/spots_routing.dart';
import 'package:flutter/material.dart';

class SpotsClosestToUserMap extends StatelessWidget {
  const SpotsClosestToUserMap(
    this.state, {
    required this.mapCoordinator,
  });

  final MapCoordinator mapCoordinator;
  final SpotsClosestToUserFetchSuccessful state;

  @override
  Widget build(BuildContext context) {
    return mapCoordinator.buildMapWithSpots(
      context,
      clusters: state.spots.mapToMapClusterModels(),
      mapEssentials: MapEssentials(
        initialCoordinates: state.userLocation,
        // TODO Rethink this zoom - shouldn't it be more strict?
        maxZoom: Constants.maps.maxLocationZoom,
        minZoom: Constants.maps.minLocationZoom,
        zoom: Constants.maps.defaultPositionDirectZoom,
      ),
      onSpotPressed: (spot) => _goToSpotDetails(context, spot),
    );
  }

  void _goToSpotDetails(BuildContext context, WorkoutSpotModel spot) => RootNavigator.of(context).pushNamed(
        SpotsRouting.spotDetails,
        arguments: SpotDetailsArguments(
          spot: spot,
        ),
      );
}
