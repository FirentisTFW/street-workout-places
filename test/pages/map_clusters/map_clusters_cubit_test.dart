import 'package:app/application/blocs/filters/filters_cubit.dart';
import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:app/domain/core/common/maps/map_coordinator.dart';
import 'package:app/domain/models/map_bounds_model.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/domain/services/filters_validation_service.dart';
import 'package:app/domain/services/map_clusters_service.dart';
import 'package:app/domain/services/spots_filtering_service.dart';
import 'package:app/domain/services/user_location_service.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/presentation/pages/map_clusters/map_clusters_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';

void main() {
  group('MapClustersCubitTest -', () {
    group('updateClustersBasedOnSpots -', () {
      const MapBoundsModel mapBounds = MapBoundsModel(
        northEast: MapPosition(latitude: 1.0, longitude: 2.0),
        southWest: MapPosition(latitude: 2.0, longitude: 1.0),
      );
      setUp(
        () => registerFallbackValue(mapBounds),
      );
      final List<WorkoutSpotModel> spots = [
        const WorkoutSpotModel(
          id: 1,
          coordinates: MapPosition(
            latitude: 52.39963,
            longitude: 16.92525,
          ),
        ),
        const WorkoutSpotModel(
          id: 2,
          coordinates: MapPosition(
            latitude: 52.38908,
            longitude: 16.92539,
          ),
        ),
      ];
      final SpotsCubit spotsCubit = SpotsCubit(
        filtersCubit: FiltersCubit(
          filtersValidator: FiltersValidationService(),
          userLocationService: UserLocationService(),
        ),
        spotsRepository: MockSpotsRepository(),
        spotsFilteringService: SpotsFilteringService(),
        userLocationService: UserLocationService(),
      );
      final MapClustersService mapClustersService = MockMapClustersService();
      final MapCoordinator mapCoordinator = MockMapCoordinator();

      test(
          'When SpotsCubit emits new state with filtered spots, MapClustersService.createClustersForSpots() method is called',
          () async {
        when(
          () => mapClustersService.createClustersForSpots(
            bounds: any(named: 'bounds'),
            spots: any(named: 'spots'),
            zoom: any(named: 'zoom'),
          ),
        ).thenReturn([]);
        when(() => mapCoordinator.bounds).thenReturn(mapBounds);
        when(() => mapCoordinator.zoom).thenReturn(8.0);
        // ignore: unused_local_variable
        final MapClustersCubit mapClustersCubit = MapClustersCubit(
          mapClustersService: mapClustersService,
          spotsCubit: spotsCubit,
          mapCoordinator: mapCoordinator,
          userLocationService: UserLocationService(),
        );
        spotsCubit.emit(
          SpotsFetchSuccess(
            filteredSpots: spots,
            spots: spots,
          ),
        );
        // Wait for bloc to react - event-loop workaround
        await Future.delayed(Duration.zero);
        verify(
          () => mapClustersService.createClustersForSpots(
            bounds: any(named: 'bounds'),
            spots: spots,
            zoom: any(named: 'zoom'),
          ),
        ).called(1);
      });
    });
  });
}
