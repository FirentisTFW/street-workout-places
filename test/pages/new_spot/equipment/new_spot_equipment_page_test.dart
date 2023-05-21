import 'package:app/domain/core/common/app_locales.dart';
import 'package:app/domain/models/new_spot_form_data.dart';
import 'package:app/domain/services/equipment_selection_validation_service.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_arguments.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_cubit.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_page.dart';
import 'package:app/presentation/widgets/button.dart';
import 'package:app/presentation/widgets/selectable_option_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

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

  late NewSpotEquipmentCubit cubit;

  setUp(() {
    cubit = NewSpotEquipmentCubit(
      arguments: arguments,
      equipment: equipment,
      selectedEquipmentValidator: EquipmentSelectionValidationService(),
    );
  });

  Widget provideTestablePage() {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: AppLocales.supportedLocales,
      home: BlocProvider.value(
        value: cubit,
        child: const NewSpotEquipmentPage(),
      ),
    );
  }

  group('NewSpotEquipmentCubitTest -', () {
    group('proceedToNextStep -', () {
      patrolTest('When no equipment item is selected, shows error dialog', ($) async {
        await $.pumpWidgetAndSettle(provideTestablePage());

        expect(find.byType(SelectableOptionCell), equals(findsWidgets)); // verify initial state

        await $.tap(find.byType(Button));
        await $.pumpAndSettle();

        expect(find.byType(Dialog), findsOneWidget);
      });
      // TODO Uncomment and implement
      // patrolTest('When some of equipment items are selected, navigates to image selection page', ($) async {
      //   await $.pumpWidgetAndSettle(provideTestablePage());

      //   expect(find.byType(EquipmentCell), equals(findsWidgets)); // verify initial state

      //   await $.tap(find.byType(PrimaryButton));
      // });
    });
  });
}
