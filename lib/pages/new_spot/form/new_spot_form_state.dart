part of 'new_spot_form_cubit.dart';

@freezed
class NewSpotFormState with _$NewSpotFormState {
  const factory NewSpotFormState.initial() = _Initial;

  const factory NewSpotFormState.validationFailed({
    required String? message,
  }) = _ValidationFailed;

  const factory NewSpotFormState.validationSuccessful({
    required NewSpotFormData formData,
    UniqueProp? uniqueProp,
  }) = _ValidationSuccessful;
}
