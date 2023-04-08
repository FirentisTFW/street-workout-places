part of 'new_spot_form_cubit.dart';

@freezed
abstract class NewSpotFormState extends Equatable {
  const NewSpotFormState();

  @override
  List<Object?> get props => [];
}

class NewSpotFormInitial extends NewSpotFormState {
  const NewSpotFormInitial();
}

class NewSpotFormValidationFailed extends NewSpotFormState {
  final String? message;

  const NewSpotFormValidationFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        message,
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
