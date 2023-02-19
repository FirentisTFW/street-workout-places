import 'package:app/networking/models/map_position.dart';

class MapBoundsModel {
  final MapPosition northEast;
  final MapPosition southWest;

  const MapBoundsModel({
    required this.northEast,
    required this.southWest,
  });
}
