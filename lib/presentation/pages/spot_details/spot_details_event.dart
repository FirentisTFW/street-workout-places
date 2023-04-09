part of 'spot_details_bloc.dart';

@freezed
class SpotDetailsEvent with _$SpotDetailsEvent {
  const factory SpotDetailsEvent.fetchReviewsRequested() = _FetchReviewsRequested;
}
