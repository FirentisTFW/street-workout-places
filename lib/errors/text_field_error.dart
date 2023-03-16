import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class TextFieldError {
  const TextFieldError();

  String getMessage(BuildContext context);
}

class BlankTextFieldError extends TextFieldError {
  const BlankTextFieldError();

  @override
  String getMessage(BuildContext context) => S.of(context).blankTextFieldErrorMessage;
}
