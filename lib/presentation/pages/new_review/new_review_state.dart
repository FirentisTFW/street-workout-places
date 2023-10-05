part of 'new_review_cubit.dart';

sealed class NewReviewState extends Equatable {
  const NewReviewState();

  @override
  List<Object> get props => [];
}

final class NewReviewInitial extends NewReviewState {
  const NewReviewInitial();
}

final class NewReviewInProgress extends NewReviewState {
  const NewReviewInProgress();
}

final class NewReviewSuccess extends NewReviewState {
  const NewReviewSuccess();
}

final class NewReviewFailure extends NewReviewState {
  final DialogError error;

  const NewReviewFailure(this.error);

  @override
  List<Object> get props => [
        error,
      ];
}
