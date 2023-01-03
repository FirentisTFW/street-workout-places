import 'package:app/common/bloc_page_state.dart';
import 'package:app/pages/map/map_bloc.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends BlocPageState<MapPage, MapBloc> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MAP'),
      ),
    );
  }
}
