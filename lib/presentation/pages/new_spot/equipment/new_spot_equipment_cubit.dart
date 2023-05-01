import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/domain/services/equipment_selection_validation_service.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/presentation/common/presentation_events.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_arguments.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_presentation_event.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_spot_equipment_state.dart';

class NewSpotEquipmentCubit extends Cubit<NewSpotEquipmentState> with BlocPresentationMixin {
  final NewSpotEquipmentArguments arguments;
  final Map<Equipment, ValueNotifier<bool>> equipmentNotifiers;
  final EquipmentSelectionValidationService selectedEquipmentValidator;

  NewSpotEquipmentCubit({
    required this.arguments,
    required List<Equipment> equipment,
    required this.selectedEquipmentValidator,
  })  : equipmentNotifiers = _prepareEquipmentNotifiers(equipment),
        super(
          NewSpotEquipmentState(equipment),
        );

  void proceedToNextStep() {
    final UserInputError? validationError = selectedEquipmentValidator.validate(equipmentNotifiers);
    final bool isFormValid = validationError == null;
    if (!isFormValid) {
      emitPresentation(
        ValidationFailed(
          error: DialogError.fromException(validationError),
        ),
      );
    } else {
      final List<Equipment> selectedEquipment = equipmentNotifiers.entries
          .where(
            (mapEntry) => mapEntry.value.value,
          )
          .map(
            (mapEntry) => mapEntry.key,
          )
          .toList();
      emitPresentation(
        NewSpotEquipmentValidationSuccessful(
          formData: arguments.formData,
          selectedEquipment: selectedEquipment,
        ),
      );
    }
  }

  static Map<Equipment, ValueNotifier<bool>> _prepareEquipmentNotifiers(List<Equipment> equipment) {
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
