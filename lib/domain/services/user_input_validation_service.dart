import 'package:app/domain/core/common/user_input_field.dart';
import 'package:app/domain/core/errors/user_input/user_input_error.dart';

class UserInputValidationService {
  UserInputError? validate(
    List<UserInputField> userInputFields, {
    bool shouldForceDisplayingError = true,
  }) {
    UserInputError? error;
    for (final UserInputField userInputField in userInputFields) {
      final UserInputError? validationError = userInputField.validate();
      if (validationError != null) {
        error = validationError;
        userInputField.shouldForceDisplayingError = shouldForceDisplayingError;
      }
    }
    return error;
  }
}
