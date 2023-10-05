import 'package:app/domain/core/common/text_field_essentials.dart';
import 'package:app/domain/core/utils/text_field_validation_utils.dart';
import 'package:app/presentation/pages/new_review/new_review_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin NewReviewForm on Cubit<NewReviewState> {
  final TextFieldEssentials contentTFE = TextFieldEssentials(
    TextFieldValidationUtils.notBlank,
    isRequired: true,
  );
  final TextFieldEssentials titleTFE = TextFieldEssentials(
    TextFieldValidationUtils.notBlank,
    isRequired: true,
  );

  List<TextFieldEssentials> get userInputsToValidate => [
        contentTFE,
        titleTFE,
      ];

  void disposeForm() {
    for (final TextFieldEssentials element in userInputsToValidate) {
      element.dispose();
    }
  }
}
