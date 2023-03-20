import 'package:app/errors/user_input/user_input_error.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class TextFieldError extends UserInputError {
  const TextFieldError();
}

class BlankTextFieldError extends TextFieldError {
  const BlankTextFieldError();

  @override
  String getMessage(BuildContext context) => S.of(context).blankTextFieldErrorMessage;
}
