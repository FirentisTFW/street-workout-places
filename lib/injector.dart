import 'package:app/domain/core/common/global_navigator.dart';
import 'package:app/domain/services/map_clusters_service.dart';
import 'package:app/infrastructure/repositories/reviews/fake_reviews_repository.dart';
import 'package:app/infrastructure/repositories/reviews/reviews_repository.dart';
import 'package:app/infrastructure/repositories/spots/fake_network_spots_repository.dart';
import 'package:app/infrastructure/repositories/spots/network_spots_repository.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static final Injector _instance = Injector._();

  GetIt get _getIt => GetIt.instance;

  factory Injector() => _instance;

  Injector._() {
    _registerGlobalNavigator();
    _registerServices();
    // TODO Add app flavors and based on that register either fake or real network repositories
    _registerFakeNetworkRepositories();
  }

  void _registerGlobalNavigator() {
    _getIt.registerSingleton<GlobalNavigator>(
      GlobalNavigator(),
    );
  }

  void _registerServices() {
    _getIt.registerFactory(MapClustersService.new);
  }

  void _registerFakeNetworkRepositories() {
    _getIt.registerFactory<NetworkSpotsRepository>(() => const FakeNetworkSpotsRepository());
    _getIt.registerFactory<ReviewsRepository>(() => const FakeReviewsRepository());
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
