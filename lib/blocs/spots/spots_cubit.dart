import 'package:app/errors/ui_error.dart';
import 'package:app/mappers/mappers.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/networking/models/workout_spot.dart';
import 'package:app/repositories/spots/i_spots_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spots_cubit.freezed.dart';
part 'spots_state.dart';

class SpotsCubit extends Cubit<SpotsState> {
  final ISpotsRepository spotsRepository;

  SpotsCubit({
    required this.spotsRepository,
  }) : super(const _Initial());

  Future<void> fetchSpotsRequested() async {
    try {
      emit(
        const _FetchSpotsInProgress(),
      );
      // TODO Consider wrapping in ApiResponse or something similar
      final List<WorkoutSpot> spots = await spotsRepository.workoutSpots();
      final List<WorkoutSpotModel> spotsModels = spots.mapToWorkoutSpotModels();
      emit(
        _FetchSpotsSuccess(
          spots: spotsModels,
        ),
      );
    } catch (exception) {
      emit(
        _FetchSpotsFailure(
          error: ContainerError.fromException(exception),
        ),
      );
    }
  }
}
