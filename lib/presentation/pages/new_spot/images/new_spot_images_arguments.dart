import 'package:app/domain/models/new_spot_form_data.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';

class NewSpotImagesArguments {
  final NewSpotFormData formData;
  final List<Equipment> equipment;

  const NewSpotImagesArguments({
    required this.formData,
    required this.equipment,
  });
}
