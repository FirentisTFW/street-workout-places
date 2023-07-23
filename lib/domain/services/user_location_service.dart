import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:geolocator/geolocator.dart';

class UserLocationService {
  Future<bool> get hasPermission async {
    final LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.whileInUse || permission == LocationPermission.always;
  }

  Future<MapPosition?> get location async {
    try {
      final Position position = await Geolocator.getCurrentPosition();
      return position.mapToMapPosition();
    } catch (_) {
      return null;
    }
  }

  Future<bool> checkAndRequestLocationPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return false;
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        return false;
      }
    }
    return true;
  }
}

extension _PositionMappers on Position {
  MapPosition mapToMapPosition() {
    return MapPosition(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
