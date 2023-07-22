import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/domain/services/user_location_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'spots_closest_to_user_state.dart';

class SpotsClosestToUserCubit extends Cubit<SpotsClosestToUserState> {
  final UserLocationService locationService;

  SpotsClosestToUserCubit({
    required this.locationService,
  }) : super(const SpotsClosestToUserInProgress());

  Future<void> fetchSpots() async {
    // check location permission
    // if no permission granted, emit proper state and finish

    // get user location
    // fetch spots based on user location

    // emit successful state

    // emit error state if fetch failed (or maybe we can just "fetch" it from SpotsCubit?)
  }
}
