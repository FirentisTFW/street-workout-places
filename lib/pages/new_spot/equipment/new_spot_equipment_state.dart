part of 'new_spot_equipment_cubit.dart';

class NewSpotEquipmentState extends Equatable {
  final List<Equipment> equipment;

  const NewSpotEquipmentState(this.equipment);

  @override
  List<Object?> get props => [
        equipment,
      ];
}
