import 'package:app/networking/models/equipment.dart';
import 'package:app/pages/new_spot/equipment/new_spot_equipment_arguments.dart';
import 'package:app/pages/new_spot/equipment/new_spot_equipment_presentation_event.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_spot_equipment_state.dart';

class NewSpotEquipmentCubit extends Cubit<NewSpotEquipmentState> with BlocPresentationMixin {
  final NewSpotEquipmentArguments arguments;
  final Map<Equipment, ValueNotifier<bool>> equipmentNotifiers;

  bool get _isAnyEquipmentItemSelected => equipmentNotifiers.values.any((notifier) => notifier.value);

  NewSpotEquipmentCubit({
    required this.arguments,
    required List<Equipment> equipment,
  })  : equipmentNotifiers = _prepareEquipmentNotifiers(equipment),
        super(
          NewSpotEquipmentState(equipment),
        );

  void proceedToNextStep() {
    final bool isFormValid = _isAnyEquipmentItemSelected;
    if (!isFormValid) {
      emitPresentation(
        // FIXME Message - is it even needed? Or can it be shown in page?
        const ValidationFailed(message: ''),
      );
    } else {
      final List<Equipment> selectedEquipment =
          equipmentNotifiers.entries.where((mapEntry) => mapEntry.value.value).map((mapEntry) => mapEntry.key).toList();
      emitPresentation(
        ValidationSuccessful(
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
