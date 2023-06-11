import 'package:app/application/blocs/filters/filters_cubit.dart';
import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:app/domain/core/common/mocks/workout_spot_mocks.dart';
import 'package:app/domain/core/errors/app_error.dart';
import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/core/mappers/workout_spot_mappers.dart';
import 'package:app/domain/services/filters_validation_service.dart';
import 'package:app/domain/services/spots_filtering_service.dart';
import 'package:app/domain/services/user_location_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';

void main() {
  late FiltersCubit filtersCubit;
  late MockSpotsRepository spotsRepository;

  setUp(() {
    filtersCubit = FiltersCubit(
      filtersValidator: FiltersValidationService(),
      userLocationService: UserLocationService(),
    );
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
          filtersCubit: filtersCubit,
          spotsRepository: spotsRepository,
          spotsFilteringService: SpotsFilteringService(),
          userLocationService: UserLocationService(),
        ),
        act: (cubit) => cubit.fetchSpots(),
        expect: () => [
          const SpotsFetchInProgress(),
          SpotsFetchSuccess(
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
        filtersCubit: FiltersCubit(
          filtersValidator: FiltersValidationService(),
          userLocationService: UserLocationService(),
        ),
        spotsRepository: spotsRepository,
        spotsFilteringService: SpotsFilteringService(),
        userLocationService: UserLocationService(),
      ),
      act: (cubit) => cubit.fetchSpots(),
      expect: () => [
        const SpotsFetchInProgress(),
        const SpotsFetchFailure(
          error: ContainerError(UnknownError()),
        ),
      ],
      verify: (_) => verify(() => spotsRepository.workoutSpots()).called(1),
    );
  });
  // TODO Move these tests to filters cubit test
  // group('filterSpotsByQuery -', () {
  //   const WorkoutSpotModel poznanSpot = WorkoutSpotModel(
  //     name: 'Poznan fajny park',
  //     address: Address(
  //       city: 'Poznan',
  //       street: 'Warszawska',
  //     ),
  //   );
  //   const WorkoutSpotModel krakowSpot = WorkoutSpotModel(
  //     name: 'Krakow fajny park',
  //     address: Address(
  //       city: 'Krakow',
  //       street: 'Poznanska',
  //     ),
  //   );

  //   const List<WorkoutSpotModel> spots = [
  //     poznanSpot,
  //     krakowSpot,
  //   ];
  //   blocTest<SpotsCubit, SpotsState>(
  //     'When entry state is not _FetchSpotsSuccess, emits nothing',
  //     build: () => SpotsCubit(
  //       filtersCubit: FiltersCubit(
  //         userInputValidator: UserInputValidationService(),
  //       ),
  //       spotsRepository: spotsRepository,
  //       spotsFilteringService: SpotsFilteringService(),
  // userLocationService: UserLocationService(),
  //     ),
  //     act: (cubit) => cubit.filterSpotsByQuery('Poznan'),
  //     expect: () => [],
  //   );
  //   group('When entry state is _FetchSpotsSuccess -', () {
  //     const SpotsState initialState = SpotsFetchSuccess(
  //       filteredSpots: spots,
  //       spots: spots,
  //     );
  //     blocTest<SpotsCubit, SpotsState>(
  //       'Every spot matching query',
  //       build: () => SpotsCubit(
  //         filtersCubit: filtersCubit,
  //         spotsRepository: spotsRepository,
  //         spotsFilteringService: SpotsFilteringService(),
  // userLocationService: UserLocationService(),
  //       )..emit(initialState),
  //       act: (cubit) => cubit.filterSpotsByQuery('Poznan'),
  //       expect: () => [
  //         // no state is emitted since the filtered spots hasn't changed
  //       ],
  //     );
  //     blocTest<SpotsCubit, SpotsState>(
  //       'Some spots matching query',
  //       build: () => SpotsCubit(
  //         filtersCubit: filtersCubit,
  //         spotsRepository: spotsRepository,
  //         spotsFilteringService: SpotsFilteringService(),
  // userLocationService: UserLocationService(),
  //       )..emit(initialState),
  //       act: (cubit) => cubit.filterSpotsByQuery('Krakow'),
  //       expect: () => [
  //         const SpotsFetchSuccess(
  //           filteredSpots: [
  //             krakowSpot,
  //           ],
  //           spots: spots,
  //         ),
  //       ],
  //     );
  //     blocTest<SpotsCubit, SpotsState>(
  //       'None spots matching query',
  //       build: () => SpotsCubit(
  //         filtersCubit: filtersCubit,
  //         spotsRepository: spotsRepository,
  //         spotsFilteringService: SpotsFilteringService(),
  // userLocationService: UserLocationService(),
  //       )..emit(initialState),
  //       act: (cubit) => cubit.filterSpotsByQuery('Gdansk'),
  //       expect: () => [
  //         const SpotsFetchSuccess(
  //           filteredSpots: [],
  //           spots: spots,
  //         ),
  //       ],
  //     );
  //   });
  // });
}
