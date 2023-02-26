import 'package:app/blocs/spots/spots_cubit.dart';
import 'package:app/common/maps/i_map_coordinator.dart';
import 'package:app/repositories/spots/i_spots_repository.dart';
import 'package:app/services/map_clusters_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

// Blocs & Cubits

class MockSpotsCubit extends MockCubit<SpotsState> implements SpotsCubit {}

// Services

class MockMapClustersService extends Mock implements MapClustersService {}

// Repositories

class MockSpotsRepository extends Mock implements ISpotsRepository {}

// Other

class MockMapCoordinator extends Mock implements IMapCoordinator {}
