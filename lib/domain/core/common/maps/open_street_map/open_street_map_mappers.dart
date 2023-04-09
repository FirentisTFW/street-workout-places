import 'package:app/domain/models/map_bounds_model.dart';
import 'package:app/domain/models/map_cluster_model.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:flutter_map/flutter_map.dart' as flutter_map;
import 'package:latlong2/latlong.dart';

extension LatLngMappers on LatLng {
  MapPosition mapToMapPosition() {
    return MapPosition(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension LatLngBoundsMappers on flutter_map.LatLngBounds {
  MapBoundsModel? maybeMapToMapBoundsModel() {
    final LatLng? northEastLocal = northEast;
    final LatLng? southWestLocal = southWest;
    if (northEastLocal == null || southWestLocal == null) return null;
    return MapBoundsModel(
      northEast: northEastLocal.mapToMapPosition(),
      southWest: southWestLocal.mapToMapPosition(),
    );
  }
}

extension MapPositionMappers on MapPosition {
  LatLng? maybeMapToLatLng() {
    final double? latitudeLocal = latitude;
    final double? longitudeLocal = longitude;
    if (latitudeLocal == null || longitudeLocal == null) return null;
    return LatLng(latitudeLocal, longitudeLocal);
  }
}

extension MapClusterModelMapper on MapClusterModel {
  LatLng? maybeMapToLatLng() {
    final double? latitudeLocal = latitude;
    final double? longitudeLocal = longitude;
    if (latitudeLocal == null || longitudeLocal == null) return null;
    return LatLng(latitudeLocal, longitudeLocal);
  }
}
