part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial({
    @Default(DashboardTab.home) DashboardTab tab,
  }) = _Initial;

  const factory DashboardState.popTabToRoot({
    required DashboardTab tab,
  }) = _PopTabToRoot;

  const factory DashboardState.tabChanged({
    required DashboardTab tab,
  }) = _TabChanged;
}
