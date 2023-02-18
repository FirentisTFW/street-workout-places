import 'package:app/models/map_cluster_model.dart';
import 'package:app/utils/map_utils.dart';
import 'package:fluster/fluster.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_clusters_cubit.freezed.dart';
part 'map_clusters_state.dart';

class MapClustersCubit extends Cubit<MapClustersState> {
  Fluster<MapClusterModel> _clusterMaker = MapUtils.provideClusterMaker(
    spots: [],
  );

  MapClustersCubit()
      : super(
          const MapClustersState.initial(
            clusters: [],
          ),
        );
}
