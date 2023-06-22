import 'package:equatable/equatable.dart';

class MapPosition extends Equatable {
  final double? latitude;
  final double? longitude;

  const MapPosition({
    this.latitude,
    this.longitude,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
