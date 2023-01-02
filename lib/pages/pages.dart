import 'package:app/pages/dashboard/dashboard_bloc.dart';
import 'package:app/pages/dashboard/dashboard_page.dart';
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
}
