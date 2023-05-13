part of 'dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  final DashboardTab tab;

  const DashboardState({
    required this.tab,
  });

  @override
  List<Object?> get props => [
        tab,
      ];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial({
    required super.tab,
  });
}

class DashboardPopTabToRoot extends DashboardState {
  const DashboardPopTabToRoot({
    required super.tab,
  });
}
