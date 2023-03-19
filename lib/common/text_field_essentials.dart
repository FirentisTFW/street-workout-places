import 'package:app/common/custom_types.dart';
import 'package:app/common/global_navigator.dart';
import 'package:app/common/user_input_field.dart';
import 'package:app/injector/injector.dart';
import 'package:app/utils/text_field_validation_utils.dart';
import 'package:flutter/material.dart';

class TextFieldEssentials extends UserInputField {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final TextFieldValidator validator;

  String get text => controller.text;

  TextFieldEssentials(this.validator);

  TextFieldEssentials.noValidation() : validator = TextFieldValidationUtils.noValidation;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }

  @override
  bool validate() => validator(text) == null;

  @override
  String? provideErrorMessage() {
    final BuildContext? context = Injector().resolve<GlobalNavigator>().currentContext;
    if (context == null) return null;
    return validator(text)?.getMessage(context);
  }
}
