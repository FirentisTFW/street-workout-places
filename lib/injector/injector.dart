import 'package:app/common/global_navigator.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static final Injector _instance = Injector._();

  GetIt get _getIt => GetIt.instance;

  factory Injector() => _instance;

  Injector._() {
    _initGlobalNavigator();
  }

  void _initGlobalNavigator() {
    _getIt.registerSingleton<GlobalNavigator>(
      GlobalNavigator(),
    );
  }

  T resolve<T extends Object>([
    String? instanceName,
  ]) =>
      _getIt.get<T>(
        instanceName: instanceName,
      );

  void unregister<T extends Object>([
    String? instanceName,
  ]) {
    _getIt.unregister<T>(
      instanceName: instanceName,
    );
  }
}
