import 'package:app/application/blocs/filters/filters_form.dart';
import 'package:app/domain/core/common/unique_prop_provider.dart';
import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/models/filters.dart';
import 'package:app/domain/services/user_input_validation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filters_state.dart';

class FiltersCubit extends Cubit<FiltersState> with FiltersForm {
  final UserInputValidationService userInputValidator;

  FiltersCubit({
    required this.userInputValidator,
  }) : super(const FiltersState.empty());

  @override
  Future<void> close() {
    disposeForm();
    return super.close();
  }

  void saveFilters() {
    final UserInputError? validationError = userInputValidator.validate(userInputsToValidate);
    final bool isFormValid = validationError == null;
    if (!isFormValid) return;

    emit(
      FiltersState(
        filters: Filters(
          maxDistanceInKm: maxDistanceInKm,
          equipment: equipmentNotifiers.takeSelectedValues(),
          sizes: sizeNotifiers.takeSelectedValues(),
          surfaces: surfaceNotifiers.takeSelectedValues(),
        ),
      ),
    );
  }

  void clearFilters() {
    // FIXME Unselect all filters in notifiers
    //  and reconsider usage of notifiers at all

    emit(
      const FiltersState.empty(),
    );
  }
}
