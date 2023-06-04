import 'package:app/application/blocs/filters/filters_cubit.dart';
import 'package:app/domain/core/common/query_controller.dart';
import 'package:app/domain/core/common/text_field_essentials.dart';
import 'package:app/domain/core/utils/text_field_validation_utils.dart';
import 'package:app/domain/core/utils/value_notifier_utils.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin FiltersForm on Cubit<FiltersState> {
  final TextFieldEssentials maxDistanceInKmTFE = TextFieldEssentials(
    TextFieldValidationUtils.number,
  );
  final Map<Equipment, ValueNotifier<bool>> equipmentNotifiers =
      ValueNotifierUtils.prepareBoolNotifiersForEnum(Equipment.values);
  final Map<WorkoutSpotSize, ValueNotifier<bool>> sizeNotifiers =
      ValueNotifierUtils.prepareBoolNotifiersForEnum(WorkoutSpotSize.values);
  final Map<Surface, ValueNotifier<bool>> surfaceNotifiers =
      ValueNotifierUtils.prepareBoolNotifiersForEnum(Surface.values);
  final QueryController queryController = QueryController.withDefaultDuration();
  final TextFieldEssentials queryTFE = TextFieldEssentials.noValidation();

  double? get maxDistanceInKm => double.tryParse(maxDistanceInKmTFE.text);

  String? get query => queryTFE.text.isEmpty ? null : queryTFE.text;

  void disposeForm() {
    maxDistanceInKmTFE.dispose();
    queryController.dispose();
    queryTFE.dispose();
    for (final Map<Enum, ValueNotifier<bool>> map in [
      equipmentNotifiers,
      sizeNotifiers,
      surfaceNotifiers,
    ]) {
      map.forEach((_, value) => value.dispose());
    }
  }
}
