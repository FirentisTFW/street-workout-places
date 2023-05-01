import 'package:app/domain/models/new_spot_form_data.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:bloc_presentation/bloc_presentation.dart';

abstract class NewSpotEquipmentPresentationEvent implements BlocPresentationEvent {
  const NewSpotEquipmentPresentationEvent();
}

class NewSpotEquipmentValidationSuccessful extends NewSpotEquipmentPresentationEvent {
  final NewSpotFormData formData;
  final List<Equipment> selectedEquipment;

  const NewSpotEquipmentValidationSuccessful({
    required this.formData,
    required this.selectedEquipment,
  });
}
