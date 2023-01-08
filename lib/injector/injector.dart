import 'package:app/common/global_navigator.dart';
import 'package:app/repositories/spots/fake_network_spots_repository.dart';
import 'package:app/repositories/spots/i_network_spots_repository.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static final Injector _instance = Injector._();

  GetIt get _getIt => GetIt.instance;

  factory Injector() => _instance;

  Injector._() {
    _registerGlobalNavigator();
    // TODO Add app flavors and based on that register either fake or real network repositories
    _registerFakeNetworkRepositories();
  }

  void _registerGlobalNavigator() {
    _getIt.registerSingleton<GlobalNavigator>(
      GlobalNavigator(),
    );
  }

  void _registerFakeNetworkRepositories() {
    _getIt.registerFactory<INetworkSpotsRepository>(() => const FakeNetworkSpotsRepository());
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
