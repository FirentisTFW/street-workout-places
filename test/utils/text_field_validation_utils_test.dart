import 'package:app/domain/core/errors/user_input/text_field_error.dart';
import 'package:app/domain/core/utils/text_field_validation_utils.dart';
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
    group('number -', () {
      test('When passed integer number, returns null', () {
        final TextFieldError? result = TextFieldValidationUtils.number('23');
        expect(result, null);
      });
      test('When passed double number, returns null', () {
        final TextFieldError? result = TextFieldValidationUtils.number('23.3242');
        expect(result, null);
      });
      test('When passed non-blank text, returns NotNumberTextFieldError', () {
        final TextFieldError? result = TextFieldValidationUtils.number('example text');
        expect(result, const NotNumberTextFieldError());
      });
      group('When passed blank text -', () {
        test('And canBeBlank = true, returns null', () {
          final TextFieldError? result = TextFieldValidationUtils.number('');
          expect(result, null);
        });
        test('And canBeBlank = false, returns BlankTextFieldError', () {
          final TextFieldError? result = TextFieldValidationUtils.number(
            '',
            canBeBlank: false,
          );
          expect(result, const BlankTextFieldError());
        });
      });
    });
  });
}
