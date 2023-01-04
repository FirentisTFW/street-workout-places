import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spots_bloc.freezed.dart';
part 'spots_event.dart';
part 'spots_state.dart';

class SpotsBloc extends Bloc<SpotsEvent, SpotsState> {
  SpotsBloc() : super(const _Initial()) {
    // TODO Implement
  }
}
