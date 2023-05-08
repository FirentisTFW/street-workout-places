import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/generated/l10n.dart';

abstract class ValueNotifierError extends UserInputError {
  const ValueNotifierError();
}

class EmptyValueNotifierError extends ValueNotifierError {
  const EmptyValueNotifierError();

  @override
  String getMessage(S s) => s.emptyValueNotifierErrorMessage;
}

class NotSelectedMapPositionValueNotifierError extends ValueNotifierError {
  const NotSelectedMapPositionValueNotifierError();

  @override
  String getMessage(S s) => s.notSelectedMapPositionValueNotifierErrorMessage;
}

class NotSelectedAnyEquipmentItemError extends ValueNotifierError {
  const NotSelectedAnyEquipmentItemError();

  @override
  String getMessage(S s) => s.notSelectedAnyEquipmentItemErrorMessage;
}
