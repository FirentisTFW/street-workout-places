import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/models/new_spot_form_data.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:bloc_presentation/bloc_presentation.dart';

abstract class NewSpotEquipmentPresentationEvent implements BlocPresentationEvent {
  const NewSpotEquipmentPresentationEvent();
}

class ValidationFailed extends NewSpotEquipmentPresentationEvent {
  final DialogError error;

  const ValidationFailed({
    required this.error,
  });
}

class ValidationSuccessful extends NewSpotEquipmentPresentationEvent {
  final NewSpotFormData formData;
  final List<Equipment> selectedEquipment;

  const ValidationSuccessful({
    required this.formData,
    required this.selectedEquipment,
  });
}
