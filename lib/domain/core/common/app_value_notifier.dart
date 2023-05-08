import 'package:app/domain/core/common/custom_types.dart';
import 'package:app/domain/core/common/user_input_field.dart';
import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/domain/core/utils/value_notifier_validation_utils.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppValueNotifier<T> extends UserInputField {
  final ValueNotifier<T> _notifier;
  final ValueNotifierValidator<T> validator;

  ValueNotifier<T> get notifier => _notifier;

  T get value => _notifier.value;

  set value(T newValue) => _notifier.value = newValue;

  AppValueNotifier({
    required T initialValue,
    required this.validator,
  }) : _notifier = ValueNotifier(initialValue);

  AppValueNotifier.withNotEmptyValidation(T initialValue)
      : _notifier = ValueNotifier(initialValue),
        validator = ValueNotifierValidationUtils.notEmpty<T>;

  @override
  void dispose() => _notifier.dispose();

  @override
  String? provideErrorMessage(S s) => validator(value)?.getMessage(s);

  String? provideErrorMessageIfShouldBeDisplayed(S s) {
    if (!shouldForceDisplayingError) return null;
    return provideErrorMessage(s);
  }

  @override
  UserInputError? validate() => validator(value);
}
