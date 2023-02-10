import 'package:app/networking/models/map_position.dart';

abstract class Constants {
  const Constants._();

  static final _App app = _App();
  static final _Maps maps = _Maps();
  static final _Search search = _Search();
}

class _App {
  final String packageName = 'com.firentistfw.streetworkoutplaces';
}

class _Maps {
  final double defaultLatitude = 51.9189046;
  final double defaultLongitude = 19.1343786;
  final double defaultSearchDistance = 799.0;
  final double defaultZoom = 5.5;
  final double maxLocationZoom = 18.0;
  final double minLocationZoom = 5.0;
  final String openStreetMapTileUrlTemplate = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  MapPosition get defaultLocation => MapPosition(
        latitude: defaultLatitude,
        longitude: defaultLongitude,
      );
}

class _Search {
  final Duration queryTimerReaction = const Duration(
    milliseconds: 300,
  );
}
