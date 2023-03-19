import 'package:app/common/maps/i_map_coordinator.dart';
import 'package:app/pages/new_spot/new_spot_form.dart';
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
      emit(
        const _ValidationSuccessful(),
      );
    }
  }
}
