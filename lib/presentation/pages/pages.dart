import 'package:app/domain/core/common/maps/i_map_coordinator.dart';
import 'package:app/domain/services/equipment_selection_validation_service.dart';
import 'package:app/domain/services/user_input_validation_service.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/presentation/pages/dashboard/dashboard_bloc.dart';
import 'package:app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:app/presentation/pages/home/home_bloc.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/more/more_bloc.dart';
import 'package:app/presentation/pages/more/more_page.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_arguments.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_cubit.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_page.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form_cubit.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form_page.dart';
import 'package:app/presentation/pages/new_spot/initial/new_spot_initial_page.dart';
import 'package:app/presentation/pages/spot_details/spot_details_arguments.dart';
import 'package:app/presentation/pages/spot_details/spot_details_bloc.dart';
import 'package:app/presentation/pages/spot_details/spot_details_page.dart';
import 'package:app/presentation/pages/spots/spots_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Pages {
  const Pages._();

  static Widget dashboard() {
    return BlocProvider<DashboardBloc>(
      create: (_) => DashboardBloc(),
      child: const DashboardPage(),
    );
  }

  static Widget home() {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(),
      child: const HomePage(),
    );
  }

  static Widget more() {
    return BlocProvider<MoreBloc>(
      create: (_) => MoreBloc(),
      child: const MorePage(),
    );
  }

  static Widget newSpotEquipment(dynamic arguments) {
    return BlocProvider<NewSpotEquipmentCubit>(
      create: (_) => NewSpotEquipmentCubit(
        arguments: arguments as NewSpotEquipmentArguments,
        equipment: Equipment.values,
        selectedEquipmentValidator: EquipmentSelectionValidationService(),
      ),
      child: const NewSpotEquipmentPage(),
    );
  }

  static Widget newSpotForm() {
    return BlocProvider<NewSpotFormCubit>(
      create: (_) => NewSpotFormCubit(
        mapCoordinator: IMapCoordinator.create(),
        userInputValidator: UserInputValidationService(),
      ),
      child: const NewSpotFormPage(),
    );
  }

  static Widget newSpotInitial() {
    return const NewSpotInitialPage();
  }

  static Widget spotDetails(SpotDetailsArguments arguments) {
    return BlocProvider<SpotDetailsBloc>(
      create: (_) => SpotDetailsBloc(
        arguments: arguments,
      ),
      child: const SpotDetailsPage(),
    );
  }

  static Widget spots() {
    return const SpotsPage();
  }
}
