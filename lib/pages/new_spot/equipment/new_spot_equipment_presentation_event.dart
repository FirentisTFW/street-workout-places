import 'package:app/models/new_spot_form_data.dart';
import 'package:app/networking/models/equipment.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:equatable/equatable.dart';

abstract class NewSpotEquipmentPresentationEvent extends Equatable implements BlocPresentationEvent {
  const NewSpotEquipmentPresentationEvent();

  @override
  List<Object?> get props => [];
}

class ValidationFailed extends NewSpotEquipmentPresentationEvent {
  final String? message;

  const ValidationFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        message,
      ];
}

class ValidationSuccessful extends NewSpotEquipmentPresentationEvent {
  final NewSpotFormData formData;
  final List<Equipment> selectedEquipment;

  const ValidationSuccessful({
    required this.formData,
    required this.selectedEquipment,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        formData,
        selectedEquipment,
      ];
}
