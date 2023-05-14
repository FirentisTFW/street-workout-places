part of 'spot_details_cubit.dart';

class SpotDetailsState extends Equatable {
  final WorkoutSpotModel spot;

  const SpotDetailsState({
    required this.spot,
  });

  @override
  List<Object?> get props => [
        spot,
      ];
}
