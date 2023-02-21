import 'package:app/common/constants.dart';
import 'package:app/common/maps/i_map_coordinator.dart';
import 'package:app/common/maps/open_street_map/open_street_map_mappers.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/map_bounds_model.dart';
import 'package:app/models/map_cluster_model.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/styles/app_colors.dart';
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
  Widget buildMap(
    BuildContext context, {
    List<MapClusterModel> clusters = const [],
    required MapPosition initialCoordinates,
    required double maxZoom,
    required double minZoom,
    required double zoom,
    VoidCallback? onPositionChanged,
  }) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: initialCoordinates.maybeMapToLatLng(),
        enableMultiFingerGestureRace: true,
        maxZoom: maxZoom,
        minZoom: minZoom,
        zoom: zoom,
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
          markers: clusters.map(_maybePrepareSpotMarker).toList().filterNotNull(),
          rotate: true,
        ),
      ],
    );
  }

  @override
  void close() {
    _mapController.dispose();
  }

  Marker? _maybePrepareSpotMarker(MapClusterModel cluster) {
    final LatLng? latLng = cluster.maybeMapToLatLng();
    if (latLng == null) return null;
    return Marker(
      point: latLng,
      // FIXME Move this to separate widget
      builder: (_) => GestureDetector(
        onTap: cluster.onPressed,
        child: Icon(
          cluster.icon,
          color: AppColors.blue,
          size: 36.0,
        ),
      ),
    );
  }
}
