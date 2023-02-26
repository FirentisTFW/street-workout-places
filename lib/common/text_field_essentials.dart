import 'package:app/common/custom_types.dart';
import 'package:app/utils/text_field_validation_utils.dart';
import 'package:flutter/material.dart';

class TextFieldEssentials {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final TextFieldValidator validator;

  TextFieldEssentials(this.validator);

  TextFieldEssentials.noValidation() : validator = TextFieldValidationUtils.noValidation;

  String get text => controller.text;

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
