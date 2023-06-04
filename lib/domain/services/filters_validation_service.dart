import 'package:app/domain/core/errors/user_input/other_input_error.dart';
import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';

class FiltersValidationService {
  // TODO Write unit tests
  UserInputError? validate({
    required double? maxDistanceInKm,
    required MapPosition? userPosition,
  }) {
    if (maxDistanceInKm != null && userPosition == null) {
      return const NoUserPositionProvidedForFiltersError();
    }
    return null;
  }
}
