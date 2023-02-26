import 'package:flutter/material.dart';

abstract class TextFieldError {
  const TextFieldError();

  String getMessage(BuildContext context);
}

class NoneTextFieldError extends TextFieldError {
  const NoneTextFieldError();

  @override
  String getMessage(BuildContext context) {
    // TODO: implement getMessage
    throw UnimplementedError();
  }
}

class BlankTextFieldError extends TextFieldError {
  const BlankTextFieldError();

  @override
  String getMessage(BuildContext context) {
    // TODO: implement getMessage
    throw UnimplementedError();
  }
}
