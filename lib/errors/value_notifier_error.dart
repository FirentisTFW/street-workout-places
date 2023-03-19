import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class ValueNotifierError {
  const ValueNotifierError();

  String getMessage(BuildContext context);
}

class EmptyValueNotifierError extends ValueNotifierError {
  const EmptyValueNotifierError();

  @override
  String getMessage(BuildContext context) => S.of(context).emptyValueNotifierErrorMessage;
}
