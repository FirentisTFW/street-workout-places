import 'package:app/domain/models/new_spot_form_data.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';

class SubmitSpotRequest {
  final List<Equipment> equipment;
  final NewSpotFormData formData;
  final List<String> imagePaths;

  const SubmitSpotRequest({
    required this.equipment,
    required this.formData,
    required this.imagePaths,
  });
}
