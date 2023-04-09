import 'package:app/domain/core/errors/user_input/value_notifier_error.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/domain/core/utils/value_notifier_validation_utils.dart';
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
    group('notEmptyMapPosition -', () {
      test('When passed null, returns NotSelectedMapPositionValueNotifierError', () {
        final ValueNotifierError? result = ValueNotifierValidationUtils.notEmptyMapPosition(null);
        expect(result, const NotSelectedMapPositionValueNotifierError());
      });
      group('When passed value different than null -', () {
        test('And with coordinates not set, returns NotSelectedMapPositionValueNotifierError', () {
          final ValueNotifierError? result = ValueNotifierValidationUtils.notEmptyMapPosition(const MapPosition());
          expect(result, const NotSelectedMapPositionValueNotifierError());
        });
        test('And with coordinates set, returns null', () {
          final ValueNotifierError? result = ValueNotifierValidationUtils.notEmptyMapPosition(
            const MapPosition(
              latitude: 22,
              longitude: 33,
            ),
          );
          expect(result, null);
        });
      });
    });
  });
}
