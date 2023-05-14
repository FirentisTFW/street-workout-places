import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/generated/l10n.dart';

abstract class TextFieldError extends UserInputError {
  const TextFieldError();
}

class BlankTextFieldError extends TextFieldError {
  const BlankTextFieldError();

  @override
  String getMessage(S s) => s.blankTextFieldErrorMessage;
}

class NotNumberTextFieldError extends TextFieldError {
  const NotNumberTextFieldError();

  @override
  String getMessage(S s) => s.notNumberTextFieldErrorMessage;
}
