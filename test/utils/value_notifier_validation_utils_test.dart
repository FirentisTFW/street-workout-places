import 'package:app/errors/value_notifier_error.dart';
import 'package:app/utils/value_notifier_validation_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValueNotifierValidationUtilsTest -', () {
    group('notEmpty -', () {
      test('When passed null, returns EmptyValueNotifierError', () {
        final ValueNotifierError? result = ValueNotifierValidationUtils.notEmpty(null);
        expect(result, const EmptyValueNotifierError());
      });
      test('When passed value different than null, returns null', () {
        final ValueNotifierError? result = ValueNotifierValidationUtils.notEmpty(20);
        expect(result, null);
      });
    });
  });
}
