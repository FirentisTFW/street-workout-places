import 'dart:async';

import 'package:app/networking/models/map_position.dart';
import 'package:map_launcher/map_launcher.dart';

class MapUtils {
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
}
