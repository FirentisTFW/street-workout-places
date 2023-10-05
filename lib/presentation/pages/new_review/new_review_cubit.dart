import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/domain/services/user_input_validation_service.dart';
import 'package:app/infrastructure/networking/requests/submit_review_request.dart';
import 'package:app/presentation/pages/new_review/new_review_form.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_review_state.dart';

class NewReviewCubit extends Cubit<NewReviewState> with NewReviewForm {
  final UserInputValidationService userInputValidator;

  NewReviewCubit({
    required this.userInputValidator,
  }) : super(const NewReviewInitial());

  Future<void> submitReview() async {
    final UserInputError? validationError = userInputValidator.validate(userInputsToValidate);
    final bool isFormValid = validationError == null;
    if (!isFormValid) return;

    emit(const NewReviewInProgress());

    final SubmitReviewRequest request = SubmitReviewRequest(
      content: contentTFE.text,
      title: titleTFE.text,
    );

    try {
      // FIXME send a request

      emit(const NewReviewSuccess());
    } catch (exception) {
      emit(
        NewReviewFailure(DialogError.fromException(exception)),
      );
    }
  }
}
