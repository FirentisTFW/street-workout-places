part of 'map_clusters_cubit.dart';

@freezed
class MapClustersState with _$MapClustersState {
  const factory MapClustersState.initial({
    required List<MapClusterModel> clusters,
  }) = _Initial;
}
