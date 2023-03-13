import 'package:app/common/maps/i_map_coordinator.dart';
import 'package:app/pages/new_spot/new_spot_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_spot_cubit.freezed.dart';
part 'new_spot_state.dart';

class NewSpotCubit extends Cubit<NewSpotState> with NewSpotForm {
  final IMapCoordinator mapCoordinator;

  NewSpotCubit({
    required this.mapCoordinator,
  }) : super(const _Initial());

  @override
  Future<void> close() {
    disposeForm();
    return super.close();
  }
}
