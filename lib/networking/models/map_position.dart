import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_position.freezed.dart';

@freezed
class MapPosition with _$MapPosition {
  const factory MapPosition({
    double? lat,
    double? lng,
  }) = _MapPosition;

  const MapPosition._();
}
