import 'package:app/domain/core/common/app_value_notifier.dart';
import 'package:app/domain/core/common/text_field_essentials.dart';
import 'package:app/domain/core/common/user_input_field.dart';
import 'package:app/domain/core/utils/text_field_validation_utils.dart';
import 'package:app/domain/core/utils/value_notifier_validation_utils.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form_cubit.dart';
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
