import 'package:flutter/foundation.dart';

abstract class ValueNotifierUtils {
  const ValueNotifierUtils._();

  static Map<T, ValueNotifier<bool>> prepareBoolNotifiersForEnum<T extends Enum>(List<T> equipment) {
    return equipment.fold(
      {},
      (map, element) => map
        ..addEntries(
          [
            MapEntry(element, ValueNotifier(false)),
          ],
        ),
    );
  }
}
