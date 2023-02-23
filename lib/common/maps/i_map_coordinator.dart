import 'package:app/common/maps/open_street_map/open_streeet_map_map_coordinator.dart';
import 'package:app/models/map_bounds_model.dart';
import 'package:app/models/map_cluster_model.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:flutter/material.dart';

abstract class IMapCoordinator {
  const IMapCoordinator();

  static IMapCoordinator create() => OpenStreetMapMapCoordinator();

  MapBoundsModel? get bounds;

  double get zoom;

  Widget buildMap(
    BuildContext context, {
    List<MapClusterModel> clusters,
    required MapPosition initialCoordinates,
    required double maxZoom,
    required double minZoom,
    required double zoom,
    VoidCallback? onPositionChanged,
    void Function(WorkoutSpotModel)? onSpotPressed,
  });

  void close();
}
