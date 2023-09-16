import 'package:equatable/equatable.dart';

sealed class HomeSection extends Equatable {
  const HomeSection();
}

final class RecentlyAddedSpotsHomeSection extends HomeSection {
  const RecentlyAddedSpotsHomeSection();

  @override
  List<Object?> get props => [];
}

final class SpotsClosestToUserHomeSection extends HomeSection {
  const SpotsClosestToUserHomeSection();

  @override
  List<Object?> get props => [];
}
