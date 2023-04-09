import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class ValueNotifierError extends UserInputError {
  const ValueNotifierError();
}

class EmptyValueNotifierError extends ValueNotifierError {
  const EmptyValueNotifierError();

  @override
  String getMessage(BuildContext context) => S.of(context).emptyValueNotifierErrorMessage;
}

class NotSelectedMapPositionValueNotifierError extends ValueNotifierError {
  const NotSelectedMapPositionValueNotifierError();

  @override
  String getMessage(BuildContext context) => S.of(context).notSelectedMapPositionValueNotifierErrorMessage;
}
