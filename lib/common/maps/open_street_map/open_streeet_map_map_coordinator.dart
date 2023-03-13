import 'package:app/common/constants.dart';
import 'package:app/common/maps/i_map_coordinator.dart';
import 'package:app/common/maps/open_street_map/open_street_map_mappers.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/map_bounds_model.dart';
import 'package:app/models/map_cluster_model.dart';
import 'package:app/models/map_essentials.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/widgets/map_markers/map_markers_factory.dart';
import 'package:app/widgets/map_markers/map_single_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart' hide MapPosition;
import 'package:latlong2/latlong.dart';

class OpenStreetMapMapCoordinator implements IMapCoordinator {
  final MapController _mapController = MapController();

  @override
  MapBoundsModel? get bounds => _mapController.bounds?.maybeMapToMapBoundsModel();

  @override
  double get zoom => _mapController.zoom;

  @override
  Widget buildMapWithSpots(
    BuildContext context, {
    List<MapClusterModel> clusters = const [],
    required MapEssentials mapEssentials,
    VoidCallback? onPositionChanged,
    void Function(WorkoutSpotModel)? onSpotPressed,
  }) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: mapEssentials.initialCoordinates.maybeMapToLatLng(),
        enableMultiFingerGestureRace: true,
        maxZoom: mapEssentials.maxZoom,
        minZoom: mapEssentials.minZoom,
        zoom: mapEssentials.zoom,
        onPositionChanged: (_, __) => onPositionChanged?.call(),
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: S.of(context).mapDataSourceOpenStreetMap,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: Constants.maps.openStreetMapTileUrlTemplate,
          userAgentPackageName: Constants.app.packageName,
        ),
        MarkerLayer(
          markers: clusters
              .map(
                (cluster) => _maybePrepareSpotMarker(
                  cluster: cluster,
                  onSpotPressed: onSpotPressed,
                ),
              )
              .toList()
              .filterNotNull(),
          rotate: true,
        ),
      ],
    );
  }

  @override
  Widget buildSimpleMap(
    BuildContext context, {
    required MapEssentials mapEssentials,
    List<MapPosition> positions = const [],
    VoidCallback? onPositionChanged,
    void Function(MapPosition)? onPositionSelected,
  }) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: mapEssentials.initialCoordinates.maybeMapToLatLng(),
        enableMultiFingerGestureRace: true,
        maxZoom: mapEssentials.maxZoom,
        minZoom: mapEssentials.minZoom,
        zoom: mapEssentials.zoom,
        onPositionChanged: (_, __) => onPositionChanged?.call(),
        onTap: (_, point) => onPositionSelected?.call(point.mapToMapPosition()),
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: S.of(context).mapDataSourceOpenStreetMap,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: Constants.maps.openStreetMapTileUrlTemplate,
          userAgentPackageName: Constants.app.packageName,
        ),
        MarkerLayer(
          markers: positions
              .map(
                (position) {
                  final LatLng? latLng = position.maybeMapToLatLng();
                  if (latLng == null) return null;
                  return Marker(
                    point: latLng,
                    builder: (_) => const MapSingleMarker(),
                  );
                },
              )
              .toList()
              .filterNotNull(),
          rotate: true,
        ),
      ],
    );
  }

  @override
  void close() {
    _mapController.dispose();
  }

  @override
  void moveToPosition(MapPosition position) {
    final LatLng? latLng = position.maybeMapToLatLng();
    if (latLng == null) return;
    _mapController.move(latLng, _mapController.zoom);
  }

  Marker? _maybePrepareSpotMarker({
    required MapClusterModel cluster,
    void Function(WorkoutSpotModel)? onSpotPressed,
  }) {
    final LatLng? latLng = cluster.maybeMapToLatLng();
    if (latLng == null) return null;
    final WorkoutSpotModel? spot = cluster.directSpot;
    return Marker(
      point: latLng,
      builder: (_) => MapMarkersFactory.fromMapCluster(
        cluster,
        onPressed: onSpotPressed == null || spot == null ? null : () => onSpotPressed(spot),
      ),
    );
  }
}
