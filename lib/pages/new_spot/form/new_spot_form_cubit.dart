import 'package:app/common/maps/i_map_coordinator.dart';
import 'package:app/common/unique_prop_provider.dart';
import 'package:app/models/new_spot_form_data.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/networking/models/surface.dart';
import 'package:app/networking/models/workout_spot_size.dart';
import 'package:app/pages/new_spot/form/new_spot_form.dart';
import 'package:app/services/user_input_validation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_spot_form_cubit.freezed.dart';
part 'new_spot_form_state.dart';

class NewSpotFormCubit extends Cubit<NewSpotFormState> with NewSpotForm {
  final IMapCoordinator mapCoordinator;
  final UserInputValidationService userInputValidator;

  NewSpotFormCubit({
    required this.mapCoordinator,
    required this.userInputValidator,
  }) : super(const _Initial());

  @override
  Future<void> close() {
    disposeForm();
    return super.close();
  }

  void proceedToNextStep() {
    final bool isFormValid = userInputValidator.validate(userInputsToValidate);
    if (!isFormValid) {
      emit(
        _$_ValidationFailed(
          message: userInputValidator.failureMessage,
        ),
      );
    } else {
      final NewSpotFormData? formData = _maybePrepareFormData();
      if (formData == null) return;
      emit(
        _ValidationSuccessful(
          formData: formData,
          uniqueProp: UniqueProp(),
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
