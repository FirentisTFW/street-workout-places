import 'package:app/build_configuration.dart';
import 'package:app/environment.dart';
import 'package:app/main_common.dart';

void main() {
  mainCommon(
    const BuildConfiguration(
      environment: Environment.dev,
    ),
  );
}
