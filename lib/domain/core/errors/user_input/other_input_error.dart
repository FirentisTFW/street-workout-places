import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/generated/l10n.dart';

abstract class OtherInputError extends UserInputError {
  const OtherInputError();
}

class TooFewImagesSelectedError extends UserInputError {
  const TooFewImagesSelectedError();

  @override
  String getMessage(S s) => s.tooFewImagesSelectedErrorMessage;
}

class NoUserPositionProvidedForFiltersError extends UserInputError {
  const NoUserPositionProvidedForFiltersError();

  @override
  String getMessage(S s) => s.noUserPositionProvidedForFiltersErrorMessage;
}
