import 'package:app/domain/core/common/mocks/workout_spot_mocks.dart';
import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/core/mappers/mappers.dart';
import 'package:app/presentation/pages/home/home_section.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  Future<void> fetchSections() async {
    try {
      emit(const HomeFetchInProgress());

      // FIXME Perform API calls and remove mocks

      emit(
        HomeFetchSuccess(
          sections: [
            SpotsClosestToUserHomeSection(
              spots: WorkoutSpotMocks.spots.mapToWorkoutSpotModels(),
            ),
            RecentlyAddedSpotsHomeSection(
              spots: WorkoutSpotMocks.spots.mapToWorkoutSpotModels(),
            ),
          ],
        ),
      );
    } catch (exception) {
      emit(
        HomeFetchFailure(
          error: ContainerError.fromException(exception),
        ),
      );
    }
  }
}
