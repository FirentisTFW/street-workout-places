import 'package:app/models/workout_spot_model.dart';
import 'package:app/pages/spot_details/spot_details_arguments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot_details_bloc.freezed.dart';
part 'spot_details_event.dart';
part 'spot_details_state.dart';

class SpotDetailsBloc extends Bloc<SpotDetailsEvent, SpotDetailsState> {
  final SpotDetailsArguments arguments;

  SpotDetailsBloc({
    required this.arguments,
  }) : super(
          _Initial(
            spot: arguments.spot,
          ),
        ) {
    // TODO: implement event handler
  }
}
