import 'package:app/errors/text_field_error.dart';
import 'package:app/utils/text_field_validation_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextFieldValidationUtils -', () {
    test('noValidation', () {
      expect(TextFieldValidationUtils.noValidation(''), null);
      expect(TextFieldValidationUtils.noValidation('jsasj2@@324ada'), null);
    });
    group('notBlank -', () {
      test('When passed non-blank text, returns null', () {
        final TextFieldError? result = TextFieldValidationUtils.notBlank('sample text');
        expect(result, null);
      });
      test('When passed blank text, returns BlankTextFieldError', () {
        final TextFieldError? result = TextFieldValidationUtils.notBlank('');
        expect(result, const BlankTextFieldError());
      });
      test('When passed text containing of whitespace characters, returns BlankTextFieldError', () {
        final TextFieldError? result = TextFieldValidationUtils.notBlank('   ');
        expect(result, const BlankTextFieldError());
      });
    });
  });
}
