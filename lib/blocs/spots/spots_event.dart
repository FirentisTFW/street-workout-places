part of 'spots_bloc.dart';

@freezed
class SpotsEvent with _$SpotsEvent {
  const factory SpotsEvent.fetchPointsRequested() = _FetchPointsRequested;
}
