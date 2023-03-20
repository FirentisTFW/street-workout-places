import 'package:app/errors/user_input/value_notifier_error.dart';
import 'package:app/networking/models/map_position.dart';

abstract class ValueNotifierValidationUtils {
  const ValueNotifierValidationUtils._();

  static ValueNotifierError? notEmpty<T>(T value) {
    if (value == null) return const EmptyValueNotifierError();
    return null;
  }

  static ValueNotifierError? notEmptyMapPosition(MapPosition? value) {
    final double? latitude = value?.latitude;
    final double? longitude = value?.longitude;
    if (latitude == null || longitude == null) return const NotSelectedMapPositionValueNotifierError();
    return null;
  }
}
