import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_spots_bloc.freezed.dart';
part 'map_spots_event.dart';
part 'map_spots_state.dart';

class MapSpotsBloc extends Bloc<MapSpotsEvent, MapSpotsState> {
  MapSpotsBloc() : super(const _Initial()) {
    // TODO Implement
  }
}
