import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Pages {
  const Pages._();

  static Widget tabBar() {
    // TODO: Create TabBarBloc and TabBarPage
    return BlocProvider<TabBarBloc>(
      create: (_) => TabBarBloc(),
      child: const TabBarPage(),
    );
  }
}
