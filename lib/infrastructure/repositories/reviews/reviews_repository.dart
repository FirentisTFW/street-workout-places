import 'package:app/domain/models/review.dart';
import 'package:app/infrastructure/networking/requests/submit_review_request.dart';

abstract interface class ReviewsRepository {
  const ReviewsRepository();

  Future<List<Review>> reviews(int workoutSpotId);

  Future<void> submitReview(SubmitReviewRequest request);
}
