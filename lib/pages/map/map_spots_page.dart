import 'package:app/common/bloc_page_state.dart';
import 'package:app/pages/map/map_spots_bloc.dart';
import 'package:flutter/material.dart';

class MapSpotsPage extends StatefulWidget {
  const MapSpotsPage({
    super.key,
  });

  @override
  State<MapSpotsPage> createState() => _MapSpotsPageState();
}

class _MapSpotsPageState extends BlocPageState<MapSpotsPage, MapSpotsBloc> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MAP'),
      ),
    );
  }
}
