import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/models/review.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/infrastructure/repositories/reviews/reviews_repository.dart';
import 'package:app/presentation/pages/spot_details/spot_details_arguments.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'spot_details_cubit.g.dart';
part 'spot_details_state.dart';

class SpotDetailsCubit extends Cubit<SpotDetailsState> {
  final SpotDetailsArguments arguments;
  final ReviewsRepository reviewsRepository;

  SpotDetailsCubit({
    required this.arguments,
    required this.reviewsRepository,
  }) : super(
          SpotDetailsState(
            reviewsState: const SpotDetailsReviewsFetched.empty(),
            spot: arguments.spot,
          ),
        );

  Future<void> fetchReviews() async {
    try {
      emit(state.fetchingReviews());

      final reviews = await reviewsRepository.reviews(arguments.spot.id);

      emit(
        state.fetchedReviews(reviews),
      );
    } catch (exception) {
      emit(
        state.fetchingReviewsFailed(ContainerError.fromException(exception)),
      );
    }
  }
}
