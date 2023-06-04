import 'package:app/infrastructure/networking/models/map_position.dart';

class UserLocationService {
  Future<bool> get hasLocationPermission => throw UnimplementedError();

  Future<MapPosition?> getUserLocation() {
    // can this method throw exception (no permission for location)?
    // we would need to then handle this and show dialog for permission
    // FIXME Implement
    throw UnimplementedError();
  }
}
