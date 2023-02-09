import 'package:app/blocs/spots/spots_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin GlobalBlocsMixin<T extends StatefulWidget> on State<T> {
  @protected
  SpotsCubit get spotsCubit => BlocProvider.of<SpotsCubit>(context);
}
