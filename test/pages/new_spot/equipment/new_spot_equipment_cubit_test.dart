import 'package:app/models/new_spot_form_data.dart';
import 'package:app/networking/models/equipment.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/networking/models/surface.dart';
import 'package:app/networking/models/workout_spot_size.dart';
import 'package:app/pages/new_spot/equipment/new_spot_equipment_arguments.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const NewSpotEquipmentArguments arguments = NewSpotEquipmentArguments(
    formData: NewSpotFormData(
      city: "Poznań",
      description: "Super plac",
      houseNumber: null,
      mapPosition: MapPosition(
        latitude: 52.38908,
        longitude: 16.92539,
      ),
      name: "Park",
      size: WorkoutSpotSize.medium,
      street: "Długa",
      surface: Surface.concrete,
    ),
  );
  const List<Equipment> equipment = Equipment.values;
  group('NewSpotEquipmentCubitTest -', () {
    group('proceedToNextStep -', () {
      // FIXME Implement
    });
  });
}
