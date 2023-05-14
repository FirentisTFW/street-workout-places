import 'package:app/domain/core/errors/user_input/text_field_error.dart';
import 'package:app/domain/core/extensions/string_extensions.dart';

abstract class TextFieldValidationUtils {
  const TextFieldValidationUtils._();

  static TextFieldError? number(
    String input, {
    bool canBeBlank = true,
  }) {
    if (input.isBlank) {
      if (!canBeBlank) return const BlankTextFieldError();
      return null;
    }
    if (double.tryParse(input) == null) return const NotNumberTextFieldError();
    return null;
  }

  static TextFieldError? notBlank(String input) {
    if (input.isBlank) return const BlankTextFieldError();
    return null;
  }

  static TextFieldError? noValidation(String _) => null;
}
