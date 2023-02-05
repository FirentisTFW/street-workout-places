import 'package:app/utils/text_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextUtils -', () {
    group('removeDiacritics -', () {
      test('lower case input -', () {
        const String sut = 'ąćęłńóśźż';
        final String result = TextUtils.removeDiacritics(sut);
        expect(result, 'acelnoszz');
      });
      test('upper case input -', () {
        const String sut = 'ĄĆĘŁŃÓŚŹŻ';
        final String result = TextUtils.removeDiacritics(sut);
        expect(result, 'ACELNOSZZ');
      });
      test('mixed case input -', () {
        const String sut = 'ĄćĘłŃóŚźŻ';
        final String result = TextUtils.removeDiacritics(sut);
        expect(result, 'AcElNoSzZ');
      });
    });
  });
}
