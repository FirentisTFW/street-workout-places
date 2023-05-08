import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

abstract class OtherInputError extends UserInputError {
  const OtherInputError();
}

class TooFewImagesSelectedError extends UserInputError {
  const TooFewImagesSelectedError();

  @override
  String getMessage(BuildContext context) => S.of(context).tooFewImagesSelectedErrorMessage;
}
