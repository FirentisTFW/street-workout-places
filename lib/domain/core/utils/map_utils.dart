import 'dart:async';

import 'package:app/domain/core/mappers/mappers.dart';
import 'package:app/domain/models/map_cluster_model.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:fluster/fluster.dart';
import 'package:map_launcher/map_launcher.dart';

abstract class MapUtils {
  const MapUtils._();

  static FutureOr<void> openMapAndLaunchNavigation({
    required MapPosition position,
  }) async {
    final Iterable<MapType> installedMaps = (await MapLauncher.installedMaps).map(
      (installedMap) => installedMap.mapType,
    );

    final MapType? mapType;
    if (installedMaps.contains(MapType.apple)) {
      mapType = MapType.apple;
    } else if (installedMaps.contains(MapType.google)) {
      mapType = MapType.google;
    } else {
      mapType = null;
    }
    if (mapType == null || !(await MapLauncher.isMapAvailable(mapType) ?? true)) return;

    final double? latitude = position.latitude;
    final double? longitude = position.longitude;
    if (latitude == null || longitude == null) return;

    await MapLauncher.showDirections(
      destination: Coords(latitude, longitude),
      mapType: mapType,
    );
  }

  static Fluster<MapClusterModel> provideClusterMaker({
    required List<WorkoutSpotModel> spots,
  }) {
    final List<MapClusterModel> points = spots.mapToMapClusterModels();

    return Fluster<MapClusterModel>(
      extent: 512,
      maxZoom: 19,
      minZoom: 1,
      nodeSize: 64,
      points: points,
      radius: 150,
      createCluster: (
        BaseCluster? cluster,
        double? longitude,
        double? latitude,
      ) =>
          MapClusterModel(
        clusterId: cluster?.id,
        coordinates: MapPosition(
          latitude: latitude,
          longitude: longitude,
        ),
        isCluster: cluster?.isCluster,
        pointsSize: cluster?.pointsSize,
      ),
    );
  }
}
