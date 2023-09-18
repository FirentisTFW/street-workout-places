part of 'spot_details_cubit.dart';

@CopyWith()
class SpotDetailsState extends Equatable {
  final SpotDetailsReviewsState reviewsState;
  final WorkoutSpotModel spot;

  const SpotDetailsState({
    required this.reviewsState,
    required this.spot,
  });

  SpotDetailsState fetchedReviews(List<Review> reviews) => copyWith(
        reviewsState: SpotDetailsReviewsFetched(reviews),
      );

  SpotDetailsState fetchingReviews() => copyWith(
        reviewsState: const SpotDetailsReviewsInProgress(),
      );

  SpotDetailsState fetchingReviewsFailed(ContainerError error) => copyWith(
        reviewsState: SpotDetailsReviewsFailure(error),
      );

  @override
  List<Object?> get props => [
        reviewsState,
        spot,
      ];
}

sealed class SpotDetailsReviewsState extends Equatable {
  const SpotDetailsReviewsState();
}

final class SpotDetailsReviewsInProgress extends SpotDetailsReviewsState {
  const SpotDetailsReviewsInProgress();

  @override
  List<Object?> get props => [];
}

final class SpotDetailsReviewsFetched extends SpotDetailsReviewsState {
  final List<Review> reviews;

  const SpotDetailsReviewsFetched(this.reviews);

  const SpotDetailsReviewsFetched.empty() : reviews = const [];

  @override
  List<Object?> get props => [
        reviews,
      ];
}

final class SpotDetailsReviewsFailure extends SpotDetailsReviewsState {
  final ContainerError error;

  const SpotDetailsReviewsFailure(this.error);

  @override
  List<Object?> get props => [
        error,
      ];
}
