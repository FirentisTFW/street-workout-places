import 'package:app/domain/models/review.dart';
import 'package:app/infrastructure/repositories/reviews/reviews_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recently_added_reviews_state.dart';

class RecentlyAddedReviewsCubit extends Cubit<RecentlyAddedReviewsState> {
  final ReviewsRepository reviewsRepository;

  RecentlyAddedReviewsCubit({
    required this.reviewsRepository,
  }) : super(const RecentlyAddedReviewsInProgress());

  Future<void> fetchReviews() async {
    emit(const RecentlyAddedReviewsInProgress());

    try {
      final List<Review> reviews = await reviewsRepository.recentlyAddedReviews();

      emit(
        RecentlyAddedReviewsFetchSuccessful(
          reviews: reviews,
        ),
      );
    } catch (_) {
      emit(
        const RecentlyAddedReviewsFetchFailure(),
      );
    }
  }
}
