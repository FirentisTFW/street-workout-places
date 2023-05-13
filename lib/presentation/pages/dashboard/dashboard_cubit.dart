import 'package:app/presentation/pages/dashboard/dashboard_tab.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
      : super(
          const DashboardInitial(
            tab: DashboardTab.home,
          ),
        );

  void changeTab(DashboardTab tab) {
    if (tab == state.tab) {
      emit(
        DashboardPopTabToRoot(
          tab: tab,
        ),
      );
    } else {
      emit(
        DashboardInitial(
          tab: tab,
        ),
      );
    }
  }
}
