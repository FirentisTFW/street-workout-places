part of 'map_spots_bloc.dart';

@freezed
class MapSpotsEvent with _$MapSpotsEvent {
  const factory MapSpotsEvent.fetchMapPointsRequested() = _FetchMapPointsRequested;
}
