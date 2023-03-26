import 'package:app/networking/models/equipment.dart';
import 'package:app/pages/new_spot/equipment/new_spot_equipment_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_spot_equipment_cubit.freezed.dart';
part 'new_spot_equipment_state.dart';

class NewSpotEquipmentCubit extends Cubit<NewSpotEquipmentState> {
  final NewSpotEquipmentArguments arguments;
  final Map<Equipment, ValueNotifier<bool>> equipmentNotifiers;

  NewSpotEquipmentCubit({
    required this.arguments,
    required List<Equipment> equipment,
  })  : equipmentNotifiers = equipment.fold(
          {},
          (map, element) => map
            ..addEntries(
              [
                MapEntry(element, ValueNotifier(false)),
              ],
            ),
        ),
        super(
          _Initial(
            equipment: equipment,
          ),
        );
}
