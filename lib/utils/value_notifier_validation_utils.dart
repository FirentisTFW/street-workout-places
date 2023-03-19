import 'package:app/errors/value_notifier_error.dart';

abstract class ValueNotifierValidationUtils {
  const ValueNotifierValidationUtils._();

  static ValueNotifierError? notEmpty<T>(T value) {
    if (value == null) return const EmptyValueNotifierError();
    return null;
  }
}
