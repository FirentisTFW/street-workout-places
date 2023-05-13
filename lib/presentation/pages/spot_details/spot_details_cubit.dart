import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/presentation/pages/spot_details/spot_details_arguments.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot_details_state.dart';

class SpotDetailsCubit extends Cubit<SpotDetailsState> {
  final SpotDetailsArguments arguments;

  SpotDetailsCubit({
    required this.arguments,
  }) : super(
          SpotDetailsState(
            spot: arguments.spot,
          ),
        );
}
