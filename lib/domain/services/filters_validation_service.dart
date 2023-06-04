import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';

class FiltersValidationService {
  UserInputError? validate({
    required double? maxDistanceInKm,
    required MapPosition? userPosition,
  }) {
    // FIXME Implement
    throw UnimplementedError();
  }
}
