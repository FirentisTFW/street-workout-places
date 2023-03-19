import 'package:app/common/maps/i_map_coordinator.dart';
import 'package:app/pages/dashboard/dashboard_bloc.dart';
import 'package:app/pages/dashboard/dashboard_page.dart';
import 'package:app/pages/home/home_bloc.dart';
import 'package:app/pages/home/home_page.dart';
import 'package:app/pages/more/more_bloc.dart';
import 'package:app/pages/more/more_page.dart';
import 'package:app/pages/new_spot/new_spot_form_cubit.dart';
import 'package:app/pages/new_spot/new_spot_form_page.dart';
import 'package:app/pages/spot_details/spot_details_arguments.dart';
import 'package:app/pages/spot_details/spot_details_bloc.dart';
import 'package:app/pages/spot_details/spot_details_page.dart';
import 'package:app/pages/spots/spots_page.dart';
import 'package:app/services/user_input_validation_service.dart';
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

  static Widget newSpot() {
    return BlocProvider<NewSpotFormCubit>(
      create: (_) => NewSpotFormCubit(
        mapCoordinator: IMapCoordinator.create(),
        userInputValidator: UserInputValidationService(),
      ),
      child: const NewSpotFormPage(),
    );
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
