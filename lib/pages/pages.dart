import 'package:app/pages/dashboard/dashboard_bloc.dart';
import 'package:app/pages/dashboard/dashboard_page.dart';
import 'package:app/pages/form/form_bloc.dart';
import 'package:app/pages/form/form_page.dart';
import 'package:app/pages/home/home_bloc.dart';
import 'package:app/pages/home/home_page.dart';
import 'package:app/pages/more/more_bloc.dart';
import 'package:app/pages/more/more_page.dart';
import 'package:app/pages/spot_details/spot_details_arguments.dart';
import 'package:app/pages/spot_details/spot_details_bloc.dart';
import 'package:app/pages/spot_details/spot_details_page.dart';
import 'package:app/pages/spots/spots_page.dart';
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

  static Widget form() {
    return BlocProvider<FormBloc>(
      create: (_) => FormBloc(),
      child: const FormPage(),
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
