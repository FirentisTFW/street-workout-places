part of 'new_spot_form_cubit.dart';

abstract class NewSpotFormState extends Equatable {
  const NewSpotFormState();

  @override
  List<Object?> get props => [];
}

class NewSpotFormInitial extends NewSpotFormState {
  const NewSpotFormInitial();
}

class NewSpotFormValidationFailed extends NewSpotFormState {
  final DialogError error;

  const NewSpotFormValidationFailed({
    required this.error,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        error,
      ];
}

class NewSpotFormValidationSuccessful extends NewSpotFormState {
  final NewSpotFormData formData;

  const NewSpotFormValidationSuccessful({
    required this.formData,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        formData,
        UniquePropProvider.get(),
      ];
}
