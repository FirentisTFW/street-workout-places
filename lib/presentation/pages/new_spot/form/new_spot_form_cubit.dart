import 'package:app/domain/core/common/maps/map_coordinator.dart';
import 'package:app/domain/core/common/unique_prop_provider.dart';
import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/domain/models/new_spot_form_data.dart';
import 'package:app/domain/services/user_input_validation_service.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_spot_form_state.dart';

class NewSpotFormCubit extends Cubit<NewSpotFormState> with NewSpotForm {
  final MapCoordinator mapCoordinator;
  final UserInputValidationService userInputValidator;

  NewSpotFormCubit({
    required this.mapCoordinator,
    required this.userInputValidator,
  }) : super(const NewSpotFormInitial());

  @override
  Future<void> close() {
    disposeForm();
    return super.close();
  }

  void proceedToNextStep() {
    final UserInputError? validationError = userInputValidator.validate(userInputsToValidate);
    final bool isFormValid = validationError == null;
    if (!isFormValid) {
      emit(
        NewSpotFormValidationFailed(
          error: DialogError.fromException(validationError),
        ),
      );
    } else {
      final NewSpotFormData? formData = _maybePrepareFormData();
      if (formData == null) return;
      emit(
        NewSpotFormValidationSuccessful(
          formData: formData,
        ),
      );
    }
  }

  NewSpotFormData? _maybePrepareFormData() {
    final MapPosition? mapPosition = mapPositionNotifier.value;
    final WorkoutSpotSize? size = sizeNotifier.value;
    final Surface? surface = surfaceNotifier.value;
    if (mapPosition == null || size == null || surface == null) return null;
    return NewSpotFormData(
      city: cityTFE.text,
      description: descriptionTFE.text,
      houseNumber: houseNumberTFE.text,
      mapPosition: mapPosition,
      name: nameTFE.text,
      size: size,
      street: streetTFE.text,
      surface: surface,
    );
  }
}
