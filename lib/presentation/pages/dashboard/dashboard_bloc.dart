import 'package:app/presentation/pages/dashboard/dashboard_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const _Initial()) {
    on<_ChangeTabRequested>(_onChangeTabRequested);
  }

  Future<void> _onChangeTabRequested(
    _ChangeTabRequested event,
    Emitter<DashboardState> emit,
  ) async {
    if (event.tab == state.tab) {
      emit(
        _PopTabToRoot(
          tab: event.tab,
        ),
      );
    } else {
      emit(
        _TabChanged(
          tab: event.tab,
        ),
      );
    }
  }
}
