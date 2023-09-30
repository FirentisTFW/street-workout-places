import 'package:app/domain/core/common/mocks/review_mocks.dart';
import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/models/review.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/presentation/pages/spot_details/spot_details_arguments.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'spot_details_cubit.g.dart';
part 'spot_details_state.dart';

class SpotDetailsCubit extends Cubit<SpotDetailsState> {
  final SpotDetailsArguments arguments;

  SpotDetailsCubit({
    required this.arguments,
  }) : super(
          SpotDetailsState(
            reviewsState: const SpotDetailsReviewsFetched.empty(),
            spot: arguments.spot,
          ),
        );

  Future<void> fetchReviews() async {
    try {
      emit(state.fetchingReviews());

      // FIXME Perform API call

      // simulate a delay
      await Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );

      emit(
        state.fetchedReviews(ReviewMocks.reviews),
      );
    } catch (exception) {
      emit(
        state.fetchingReviewsFailed(ContainerError.fromException(exception)),
      );
    }
  }
}
