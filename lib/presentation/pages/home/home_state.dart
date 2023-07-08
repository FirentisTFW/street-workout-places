part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeFetchInProgress extends HomeState {
  const HomeFetchInProgress();
}

class HomeFetchSuccess extends HomeState {
  final List<HomeSection> sections;

  const HomeFetchSuccess({
    required this.sections,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        sections,
      ];
}

class HomeFetchFailure extends HomeState {
  final ContainerError error;

  const HomeFetchFailure({
    required this.error,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        error,
      ];
}
