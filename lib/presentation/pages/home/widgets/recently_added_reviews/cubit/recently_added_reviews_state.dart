part of 'recently_added_reviews_cubit.dart';

sealed class RecentlyAddedReviewsState extends Equatable {
  const RecentlyAddedReviewsState();

  @override
  List<Object> get props => [];
}

final class RecentlyAddedReviewsInProgress extends RecentlyAddedReviewsState {
  const RecentlyAddedReviewsInProgress();
}

final class RecentlyAddedReviewsFetchSuccessful extends RecentlyAddedReviewsState {
  final List<Review> reviews;

  const RecentlyAddedReviewsFetchSuccessful({
    required this.reviews,
  });

  @override
  List<Object> get props => [
        ...super.props,
        reviews,
      ];
}

final class RecentlyAddedReviewsFetchFailure extends RecentlyAddedReviewsState {
  const RecentlyAddedReviewsFetchFailure();
}
