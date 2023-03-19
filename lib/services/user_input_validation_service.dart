import 'package:app/common/user_input_field.dart';

class UserInputValidationService {
  String? _failureMessage;

  String? get failureMessage => _failureMessage;

  bool validate(List<UserInputField> userInputFields) {
    for (final UserInputField userInputField in userInputFields) {
      if (!userInputField.validate()) {
        _failureMessage = userInputField.provideErrorMessage();
        return false;
      }
    }
    return true;
  }
}
