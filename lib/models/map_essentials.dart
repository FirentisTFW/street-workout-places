import 'package:app/networking/models/map_position.dart';

class MapEssentials {
  final MapPosition initialCoordinates;
  final double maxZoom;
  final double minZoom;
  final double zoom;

  const MapEssentials({
    required this.initialCoordinates,
    required this.maxZoom,
    required this.minZoom,
    required this.zoom,
  });
}
