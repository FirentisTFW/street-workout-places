import 'package:app/domain/core/common/constants.dart';
import 'package:app/domain/core/errors/user_input/other_input_error.dart';
import 'package:app/domain/core/errors/user_input/user_input_error.dart';

class ImagesSelectionValidationService {
  UserInputError? validate(List<String> imagePaths) {
    if (imagePaths.length >= Constants.spots.newSpotMinImageCount) {
      return null;
    }
    return const TooFewImagesSelectedError();
  }
}
