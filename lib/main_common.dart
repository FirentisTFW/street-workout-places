import 'package:app/build_configuration.dart';
import 'package:app/presentation/pages/app_entry.dart';
import 'package:flutter/material.dart';

void mainCommon(BuildConfiguration configuration) {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const AppEntry(),
  );
}
