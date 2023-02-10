import 'package:app/blocs/spots/spots_cubit.dart';
import 'package:app/common/mocks/workout_spot_mocks.dart';
import 'package:app/errors/app_error.dart';
import 'package:app/errors/ui_error.dart';
import 'package:app/mappers/workout_spot_mappers.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/networking/models/address.dart';
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
    group('fetchSpots -', () {
      blocTest<SpotsCubit, SpotsState>(
        'When successful, emits _FetchSpotsInProgress, _FetchSpotsSuccess',
        setUp: () {
          when(() => spotsRepository.workoutSpots()).thenAnswer((_) async => WorkoutSpotMocks.spots);
        },
        build: () => SpotsCubit(
          spotsRepository: spotsRepository,
        ),
        act: (cubit) => cubit.fetchSpots(),
        expect: () => [
          const SpotsState.fetchSpotsInProgress(),
          SpotsState.fetchSpotsSuccess(
            filteredSpots: WorkoutSpotMocks.spots.mapToWorkoutSpotModels(),
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
      act: (cubit) => cubit.fetchSpots(),
      expect: () => [
        const SpotsState.fetchSpotsInProgress(),
        const SpotsState.fetchSpotsFailure(
          error: ContainerError(UnknownError()),
        ),
      ],
      verify: (_) => verify(() => spotsRepository.workoutSpots()).called(1),
    );
  });
  group('filterSpotsByQuery -', () {
    const WorkoutSpotModel poznanSpot = WorkoutSpotModel(
      name: 'Poznan fajny park',
      address: Address(
        city: 'Poznan',
        street: 'Warszawska',
      ),
    );
    const WorkoutSpotModel krakowSpot = WorkoutSpotModel(
      name: 'Krakow fajny park',
      address: Address(
        city: 'Krakow',
        street: 'Poznanska',
      ),
    );

    const List<WorkoutSpotModel> spots = [
      poznanSpot,
      krakowSpot,
    ];
    blocTest<SpotsCubit, SpotsState>(
      'When entry state is not _FetchSpotsSuccess, emits nothing',
      build: () => SpotsCubit(
        spotsRepository: spotsRepository,
      ),
      act: (cubit) => cubit.filterSpotsByQuery('Poznan'),
      expect: () => [],
    );
    group('When entry state is _FetchSpotsSuccess -', () {
      const SpotsState initialState = SpotsState.fetchSpotsSuccess(
        filteredSpots: spots,
        spots: spots,
      );
      blocTest<SpotsCubit, SpotsState>(
        'Every spot matching query',
        build: () => SpotsCubit(
          spotsRepository: spotsRepository,
        )..emit(initialState),
        act: (cubit) => cubit.filterSpotsByQuery('Poznan'),
        expect: () => [
          // no state is emitted since the filtered spots hasn't changed
        ],
      );
      blocTest<SpotsCubit, SpotsState>(
        'Some spots matching query',
        build: () => SpotsCubit(
          spotsRepository: spotsRepository,
        )..emit(initialState),
        act: (cubit) => cubit.filterSpotsByQuery('Krakow'),
        expect: () => [
          const SpotsState.fetchSpotsSuccess(
            filteredSpots: [
              krakowSpot,
            ],
            spots: spots,
          ),
        ],
      );
      blocTest<SpotsCubit, SpotsState>(
        'None spots matching query',
        build: () => SpotsCubit(
          spotsRepository: spotsRepository,
        )..emit(initialState),
        act: (cubit) => cubit.filterSpotsByQuery('Gdansk'),
        expect: () => [
          const SpotsState.fetchSpotsSuccess(
            filteredSpots: [],
            spots: spots,
          ),
        ],
      );
    });
  });
}
