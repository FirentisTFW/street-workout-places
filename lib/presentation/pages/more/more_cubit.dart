import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(const MoreInitial());
}
