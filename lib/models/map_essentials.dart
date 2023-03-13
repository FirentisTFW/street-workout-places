import 'package:app/networking/models/map_position.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_essentials.freezed.dart';

@freezed
class MapEssentials with _$MapEssentials {
  const factory MapEssentials({
    required MapPosition initialCoordinates,
    required double maxZoom,
    required double minZoom,
    required double zoom,
  }) = _MapEssentials;

  const MapEssentials._();

  MapEssentials updateZoom(double newZoom) => copyWith(
        zoom: newZoom,
      );
}
