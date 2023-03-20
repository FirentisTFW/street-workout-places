import 'package:app/networking/models/map_position.dart';
import 'package:app/networking/models/surface.dart';
import 'package:app/networking/models/workout_spot_size.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_spot_form_data.freezed.dart';

@freezed
class NewSpotFormData with _$NewSpotFormData {
  const factory NewSpotFormData({
    required String city,
    required String description,
    required String? houseNumber,
    required MapPosition mapPosition,
    required String name,
    required WorkoutSpotSize size,
    required String? street,
    required Surface surface,
  }) = _NewSpotFormData;

  const NewSpotFormData._();
}
