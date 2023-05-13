part of 'map_clusters_cubit.dart';

class MapClustersState extends Equatable {
  final List<MapClusterModel> clusters;

  const MapClustersState({
    required this.clusters,
  });

  const MapClustersState.empty() : clusters = const [];

  @override
  List<Object?> get props => [
        clusters,
      ];
}
