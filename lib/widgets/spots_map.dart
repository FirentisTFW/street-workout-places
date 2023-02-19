import 'package:app/common/constants.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/pages/map_clusters/map_clusters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  MapClustersCubit get _mapClustersCubit => BlocProvider.of<MapClustersCubit>(context);

  @override
  Widget build(BuildContext context) {
    final mapConstants = Constants.maps;
    return _mapClustersCubit.mapCoordinator.buildMap(
      context,
      initialCoordinates: MapPosition(
        latitude: mapConstants.defaultLatitude,
        longitude: mapConstants.defaultLongitude,
      ),
      maxZoom: mapConstants.maxLocationZoom,
      minZoom: mapConstants.minLocationZoom,
      zoom: mapConstants.defaultZoom,
    );
  }
}
