part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.changeTabRequested({
    required DashboardTab tab,
  }) = _ChangeTabRequested;
}
