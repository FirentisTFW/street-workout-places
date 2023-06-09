import 'package:app/application/blocs/filters/filters_form.dart';
import 'package:app/domain/core/common/unique_prop_provider.dart';
import 'package:app/domain/core/errors/user_input/user_input_error.dart';
import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/models/filters.dart';
import 'package:app/domain/services/filters_validation_service.dart';
import 'package:app/domain/services/user_location_service.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filters_cubit.g.dart';
part 'filters_state.dart';

class FiltersCubit extends Cubit<FiltersState> with FiltersForm {
  final FiltersValidationService filtersValidator;
  final UserLocationService userLocationService;

  FiltersCubit({
    required this.filtersValidator,
    required this.userLocationService,
  }) : super(const FiltersState.empty());

  @override
  Future<void> close() {
    disposeForm();
    return super.close();
  }

  Future<void> saveFilters() async {
    if (maxDistanceInKm != null) {
      // TODO Show something to the user before asking for location

      final bool hasLocationPermission = await userLocationService.checkAndRequestLocationPermissions();
      if (!hasLocationPermission) {
        // FIXME Show dialog to the user with a button that redirects to settings,
        //  and option to filter spots without distance (clear distance filter and then filter again)
      }

      final MapPosition? userLocation = await userLocationService.location;
      final UserInputError? validationError = filtersValidator.validate(
        maxDistanceInKm: maxDistanceInKm,
        userPosition: userLocation,
      );
      final bool isFormValid = validationError == null;

      if (!isFormValid) {
        // FIXME Show validation error
      }
    }

    emit(
      FiltersState(
        filters: Filters(
          maxDistanceInKm: maxDistanceInKm,
          equipment: equipmentNotifiers.takeSelectedValues(),
          sizes: sizeNotifiers.takeSelectedValues(),
          surfaces: surfaceNotifiers.takeSelectedValues(),
          query: query,
        ),
      ),
    );
  }

  void clearFilters() {
    maxDistanceInKmTFE.clearText();
    queryTFE.clearText();

    for (final Iterable<ValueNotifier<bool>> notifierList in [
      equipmentNotifiers.values,
      sizeNotifiers.values,
      surfaceNotifiers.values,
    ]) {
      for (final ValueNotifier<bool> notifier in notifierList) {
        notifier.value = false;
      }
    }

    emit(
      const FiltersState.empty(),
    );
  }

  void updateQuery(String query) {
    queryController.updateQuery(
      query,
      action: () => emit(
        state.updateQuery(query.isBlank ? null : query),
      ),
    );
  }
}
