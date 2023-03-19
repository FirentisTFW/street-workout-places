import 'package:app/common/custom_types.dart';
import 'package:app/common/global_navigator.dart';
import 'package:app/common/user_input_field.dart';
import 'package:app/injector/injector.dart';
import 'package:app/utils/value_notifier_validation_utils.dart';
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
  String? provideErrorMessage() {
    final BuildContext? context = Injector().resolve<GlobalNavigator>().currentContext;
    if (context == null) return null;
    return validator(value)?.getMessage(context);
  }

  @override
  bool validate() => validator(value) == null;
}
