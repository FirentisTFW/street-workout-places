import 'package:app/common/text_field_essentials.dart';
import 'package:app/pages/new_spot/new_spot_cubit.dart';
import 'package:app/utils/text_field_validation_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin NewSpotForm on Cubit<NewSpotState> {
  final TextFieldEssentials cityTFE = TextFieldEssentials(TextFieldValidationUtils.notBlank);
  final TextFieldEssentials descriptionTFE = TextFieldEssentials(TextFieldValidationUtils.notBlank);
  final TextFieldEssentials houseNumberTFE = TextFieldEssentials.noValidation();
  final TextFieldEssentials latitudeTFE = TextFieldEssentials(TextFieldValidationUtils.notBlank);
  final TextFieldEssentials longitudeTFE = TextFieldEssentials(TextFieldValidationUtils.notBlank);
  final TextFieldEssentials nameTFE = TextFieldEssentials(TextFieldValidationUtils.notBlank);
  final TextFieldEssentials streetTFE = TextFieldEssentials.noValidation();

  List<TextFieldEssentials> get dataToValidate => [
        cityTFE,
        descriptionTFE,
        houseNumberTFE,
        latitudeTFE,
        longitudeTFE,
        nameTFE,
        streetTFE,
      ];

  void disposeForm() {
    for (final TextFieldEssentials element in dataToValidate) {
      element.dispose();
    }
  }
}
