import 'package:app/domain/core/common/mocks/review_mocks.dart';
import 'package:app/domain/models/review.dart';
import 'package:app/infrastructure/networking/requests/submit_review_request.dart';
import 'package:app/infrastructure/repositories/reviews/reviews_repository.dart';

final class FakeReviewsRepository implements ReviewsRepository {
  const FakeReviewsRepository();

  @override
  Future<List<Review>> reviews(int workoutSpotId) async {
    await _simulateDelay();

    return ReviewMocks.reviews;
  }

  @override
  Future<void> submitReview(SubmitReviewRequest request) => _simulateDelay();

  Future<void> _simulateDelay({
    int milliseconds = 2000,
  }) =>
      Future.delayed(
        Duration(
          milliseconds: milliseconds,
        ),
      );
}
