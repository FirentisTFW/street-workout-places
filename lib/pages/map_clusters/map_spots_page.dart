import 'package:app/common/bloc_page_state.dart';
import 'package:app/pages/map_clusters/map_clusters_cubit.dart';
import 'package:flutter/material.dart';

class MapClustersPage extends StatefulWidget {
  const MapClustersPage({
    super.key,
  });

  @override
  State<MapClustersPage> createState() => _MapClustersPageState();
}

class _MapClustersPageState extends BlocPageState<MapClustersPage, MapClustersCubit> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MAP'),
      ),
    );
  }
}
