import 'package:app/domain/models/map_cluster_model.dart';
import 'package:app/presentation/widgets/map_markers/map_cluster_marker.dart';
import 'package:app/presentation/widgets/map_markers/map_single_marker.dart';
import 'package:flutter/material.dart';

abstract class MapMarkersFactory {
  const MapMarkersFactory._();

  static Widget fromMapCluster(
    MapClusterModel mapCluster, {
    VoidCallback? onPressed,
  }) {
    return mapCluster.isCluster ?? false
        ? MapClusterMarker(
            mapCluster: mapCluster,
            onPressed: onPressed,
          )
        : MapSingleMarker(
            onPressed: onPressed,
          );
  }
}
