import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:flutter/widgets.dart';

abstract class UserInputField {
  bool shouldForceDisplayingError = false;

  void dispose();

  String? provideErrorMessage(BuildContext context);

  UserInputError? validate();
}
