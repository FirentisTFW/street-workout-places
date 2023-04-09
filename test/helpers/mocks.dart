import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:app/domain/core/common/maps/i_map_coordinator.dart';
import 'package:app/domain/services/map_clusters_service.dart';
import 'package:app/domain/services/user_input_validation_service.dart';
import 'package:app/infrastructure/repositories/spots/i_spots_repository.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

// Blocs & Cubits

class MockNewSpotCubit extends MockCubit<NewSpotFormState> with NewSpotForm implements NewSpotFormCubit {}

class MockSpotsCubit extends MockCubit<SpotsState> implements SpotsCubit {}

// Services

class MockMapClustersService extends Mock implements MapClustersService {}

class MockUserInputValidationService extends Mock implements UserInputValidationService {}

// Repositories

class MockSpotsRepository extends Mock implements ISpotsRepository {}

// Other

class MockMapCoordinator extends Mock implements IMapCoordinator {}
