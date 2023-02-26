import 'package:app/errors/text_field_error.dart';
import 'package:app/extensions/string_extensions.dart';

abstract class TextFieldValidationUtils {
  const TextFieldValidationUtils._();

  static TextFieldError notBlank(String input) {
    if (input.isBlank) return const BlankTextFieldError();
    return const NoneTextFieldError();
  }

  static TextFieldError noValidation(String _) => const NoneTextFieldError();
}
