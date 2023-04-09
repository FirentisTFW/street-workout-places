part of 'more_bloc.dart';

@freezed
class MoreEvent with _$MoreEvent {
  const factory MoreEvent.fetchDataRequested() = _FetchDataRequested;
}
