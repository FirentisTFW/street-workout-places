import 'package:app/common/constants.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/mappers/mappers.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class SpotsMap extends StatefulWidget {
  final List<WorkoutSpotModel> spots;
  final void Function(WorkoutSpotModel) onSpotIconPressed;

  const SpotsMap({
    required this.spots,
    required this.onSpotIconPressed,
  });

  @override
  State<SpotsMap> createState() => _SpotsMapState();
}

class _SpotsMapState extends State<SpotsMap> {
  final MapController _mapController = MapController();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapConstants = Constants.maps;
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: LatLng(mapConstants.defaultLatitude, mapConstants.defaultLongitude),
        enableMultiFingerGestureRace: true,
        maxZoom: mapConstants.maxLocationZoom,
        minZoom: mapConstants.minLocationZoom,
        zoom: mapConstants.defaultZoom,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: S.of(context).mapDataSourceOpenStreetMap,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: mapConstants.openStreetMapTileUrlTemplate,
          userAgentPackageName: Constants.app.packageName,
        ),
        MarkerLayer(
          markers: widget.spots.map(_maybeBuildSpotMarker).toList().filterNotNull(),
          rotate: true,
        ),
      ],
    );
  }

  Marker? _maybeBuildSpotMarker(WorkoutSpotModel spot) {
    // FIXME Change name - prepareMarker(?) and move builder part to separate widget
    final LatLng? latLng = spot.coordinates?.maybeMapToLatLng();
    if (latLng == null) return null;
    return Marker(
      point: latLng,
      builder: (_) => GestureDetector(
        onTap: () => widget.onSpotIconPressed(spot),
        child: const Icon(
          Icons.location_pin,
          color: AppColors.blue,
          size: 36.0,
        ),
      ),
    );
  }
}
