import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/domain/core/errors/user_input/value_notifier_error.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:flutter/widgets.dart';

class EquipmentSelectionValidationService {
  UserInputError? validate(Map<Equipment, ValueNotifier<bool>> equipmentNotifiers) {
    final bool isAnyEquipmentItemSelected = equipmentNotifiers.values.any((notifier) => notifier.value);
    if (isAnyEquipmentItemSelected) {
      return null;
    }
    return const NotSelectedAnyEquipmentItemError();
  }
}
