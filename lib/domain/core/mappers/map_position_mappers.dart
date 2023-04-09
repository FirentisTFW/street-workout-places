import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:latlong2/latlong.dart';

extension MapPositionMapper on MapPosition {
  LatLng? maybeMapToLatLng() {
    if (latitude == null || longitude == null) return null;
    return LatLng(latitude!, longitude!);
  }
}
