import 'package:app/domain/core/common/maps/open_street_map/open_streeet_map_map_coordinator.dart';
import 'package:app/domain/models/map_bounds_model.dart';
import 'package:app/domain/models/map_cluster_model.dart';
import 'package:app/domain/models/map_essentials.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/domain/models/zoom.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:flutter/material.dart';

abstract interface class MapCoordinator {
  const MapCoordinator();

  factory MapCoordinator.create() => OpenStreetMapMapCoordinator();

  MapBoundsModel? get bounds;

  double get zoom;

  Widget buildMapWithSpots(
    BuildContext context, {
    List<MapClusterModel> clusters,
    required MapEssentials mapEssentials,
    VoidCallback? onPositionChanged,
    void Function(MapClusterModel)? onClusterPressed,
    void Function(WorkoutSpotModel)? onSpotPressed,
  });

  Widget buildSimpleMap(
    BuildContext context, {
    required MapEssentials mapEssentials,
    List<MapPosition> positions,
    VoidCallback? onPositionChanged,
    void Function(MapPosition)? onPositionSelected,
  });

  void close();

  void moveToPosition(MapPosition position);

  void zoomToPosition({
    required MapPosition position,
    required Zoom zoom,
  });
}
