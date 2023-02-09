import 'package:app/blocs/spots/spots_cubit.dart';
import 'package:app/common/mocks/workout_spot_mocks.dart';
import 'package:app/errors/app_error.dart';
import 'package:app/errors/ui_error.dart';
import 'package:app/mappers/workout_spot_mappers.dart';
import 'package:app/repositories/spots/i_spots_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpotsRepository extends Mock implements ISpotsRepository {}

void main() {
  late MockSpotsRepository spotsRepository;
  setUp(() {
    spotsRepository = MockSpotsRepository();
  });

  group('SpotsCubitTest -', () {
    group('_FetchSpotsRequested -', () {
      blocTest<SpotsCubit, SpotsState>(
        'When successful, emits _FetchSpotsInProgress, _FetchSpotsSuccess',
        setUp: () {
          when(() => spotsRepository.workoutSpots()).thenAnswer((_) async => WorkoutSpotMocks.spots);
        },
        build: () => SpotsCubit(
          spotsRepository: spotsRepository,
        ),
        act: (bloc) => bloc.fetchSpotsRequested(),
        expect: () => [
          const SpotsState.fetchSpotsInProgress(),
          SpotsState.fetchSpotsSuccess(
            spots: WorkoutSpotMocks.spots.mapToWorkoutSpotModels(),
          ),
        ],
        verify: (_) => verify(() => spotsRepository.workoutSpots()).called(1),
      );
    });
    blocTest<SpotsCubit, SpotsState>(
      'When failure, emits _FetchSpotsInProgress, _FetchSpotsFailure',
      setUp: () {
        when(() => spotsRepository.workoutSpots()).thenThrow((_) async => Exception());
      },
      build: () => SpotsCubit(
        spotsRepository: spotsRepository,
      ),
      act: (bloc) => bloc.fetchSpotsRequested(),
      expect: () => [
        const SpotsState.fetchSpotsInProgress(),
        const SpotsState.fetchSpotsFailure(
          error: ContainerError(UnknownError()),
        ),
      ],
      verify: (_) => verify(() => spotsRepository.workoutSpots()).called(1),
    );
  });
}
