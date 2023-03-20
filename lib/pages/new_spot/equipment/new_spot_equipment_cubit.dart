import 'package:app/pages/new_spot/equipment/new_spot_equipment_arguments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_spot_equipment_cubit.freezed.dart';
part 'new_spot_equipment_state.dart';

class NewSpotEquipmentCubit extends Cubit<NewSpotEquipmentState> {
  final NewSpotEquipmentArguments arguments;

  NewSpotEquipmentCubit({
    required this.arguments,
  }) : super(const _Initial());
}
