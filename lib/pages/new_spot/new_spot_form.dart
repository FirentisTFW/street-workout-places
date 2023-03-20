import 'package:app/common/app_value_notifier.dart';
import 'package:app/common/text_field_essentials.dart';
import 'package:app/common/user_input_field.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/networking/models/surface.dart';
import 'package:app/networking/models/workout_spot_size.dart';
import 'package:app/pages/new_spot/new_spot_form_cubit.dart';
import 'package:app/utils/text_field_validation_utils.dart';
import 'package:app/utils/value_notifier_validation_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin NewSpotForm on Cubit<NewSpotFormState> {
  final TextFieldEssentials cityTFE = TextFieldEssentials(
    TextFieldValidationUtils.notBlank,
    isRequired: true,
  );
  final TextFieldEssentials descriptionTFE = TextFieldEssentials(
    TextFieldValidationUtils.notBlank,
    isRequired: true,
  );
  final TextFieldEssentials houseNumberTFE = TextFieldEssentials.noValidation();
  final AppValueNotifier<MapPosition?> mapPositionNotifier = AppValueNotifier(
    initialValue: null,
    validator: ValueNotifierValidationUtils.notEmptyMapPosition,
  );
  final TextFieldEssentials nameTFE = TextFieldEssentials(
    TextFieldValidationUtils.notBlank,
    isRequired: true,
  );
  final AppValueNotifier<WorkoutSpotSize?> sizeNotifier = AppValueNotifier.withNotEmptyValidation(null);
  final TextFieldEssentials streetTFE = TextFieldEssentials.noValidation();
  final AppValueNotifier<Surface?> surfaceNotifier = AppValueNotifier.withNotEmptyValidation(null);

  bool get isMapPositionSelected => mapPositionNotifier.value != null;

  List<UserInputField> get userInputsToValidate => [
        cityTFE,
        descriptionTFE,
        houseNumberTFE,
        mapPositionNotifier,
        nameTFE,
        sizeNotifier,
        streetTFE,
        surfaceNotifier,
      ];

  void disposeForm() {
    for (final UserInputField element in userInputsToValidate) {
      element.dispose();
    }
  }
}
