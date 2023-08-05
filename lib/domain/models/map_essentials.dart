import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'map_essentials.g.dart';

@CopyWith()
class MapEssentials extends Equatable {
  final MapPosition initialCoordinates;
  final double maxZoom;
  final double minZoom;
  final double zoom;

  const MapEssentials({
    required this.initialCoordinates,
    required this.maxZoom,
    required this.minZoom,
    required this.zoom,
  });

  @override
  List<Object?> get props => [
        initialCoordinates,
        maxZoom,
        minZoom,
        zoom,
      ];
}
