import 'package:app/domain/core/common/custom_types.dart';
import 'package:app/domain/core/common/user_input_field.dart';
import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/domain/core/utils/text_field_validation_utils.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

class TextFieldEssentials extends UserInputField {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final bool isRequired;
  final TextFieldValidator validator;

  String get text => controller.text;

  TextFieldEssentials(
    this.validator, {
    this.isRequired = false,
  });

  TextFieldEssentials.noValidation({
    this.isRequired = false,
  }) : validator = TextFieldValidationUtils.noValidation;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }

  @override
  UserInputError? validate() => validator(text);

  @override
  String? provideErrorMessage(S s) => validator(text)?.getMessage(s);
}
