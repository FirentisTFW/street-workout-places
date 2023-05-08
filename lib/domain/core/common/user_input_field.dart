import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/generated/l10n.dart';

abstract class UserInputField {
  bool shouldForceDisplayingError = false;

  void dispose();

  String? provideErrorMessage(S s);

  UserInputError? validate();
}
