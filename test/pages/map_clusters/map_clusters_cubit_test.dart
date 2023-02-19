import 'package:app/blocs/spots/spots_cubit.dart';
import 'package:app/models/map_bounds_model.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/pages/map_clusters/map_clusters_cubit.dart';
import 'package:app/services/map_clusters_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mock_repositories.dart';

class MockMapClustersService extends Mock implements MapClustersService {}

void main() {
  group('MapClustersCubitTest -', () {
    group('updateClustersBasedOnSpots -', () {
      setUp(
        () => registerFallbackValue(
          const MapBoundsModel(
            northEast: MapPosition(latitude: 1.0, longitude: 2.0),
            southWest: MapPosition(latitude: 2.0, longitude: 1.0),
          ),
        ),
      );
      final List<WorkoutSpotModel> spots = [
        const WorkoutSpotModel(
          coordinates: MapPosition(
            latitude: 52.39963,
            longitude: 16.92525,
          ),
        ),
        const WorkoutSpotModel(
          coordinates: MapPosition(
            latitude: 52.38908,
            longitude: 16.92539,
          ),
        )
      ];
      final SpotsCubit spotsCubit = SpotsCubit(
        spotsRepository: MockSpotsRepository(),
      );
      final MapClustersService mapClustersService = MockMapClustersService();
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
        // ignore: unused_local_variable
        final MapClustersCubit mapClustersCubit = MapClustersCubit(
          mapClustersService: mapClustersService,
          spotsCubit: spotsCubit,
        );
        spotsCubit.emit(
          SpotsState.fetchSpotsSuccess(
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
