import 'package:flutter/material.dart';

class TextFieldEssentials {
  // TODO Add validator
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  TextFieldEssentials();

  String get text => controller.text;

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
