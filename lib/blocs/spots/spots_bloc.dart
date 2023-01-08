import 'package:app/repositories/spots/i_spots_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spots_bloc.freezed.dart';
part 'spots_event.dart';
part 'spots_state.dart';

class SpotsBloc extends Bloc<SpotsEvent, SpotsState> {
  final ISpotsRepository spotsRepository;

  SpotsBloc({
    required this.spotsRepository,
  }) : super(const _Initial()) {
    on<_FetchSpotsRequested>(_onFetchSpotsRequested);
  }

  Future<void> _onFetchSpotsRequested(
    _FetchSpotsRequested event,
    Emitter<SpotsState> emit,
  ) async {
    // TODO Implement
  }
}
