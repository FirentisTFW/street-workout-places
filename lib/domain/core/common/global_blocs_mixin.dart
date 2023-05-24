import 'package:app/application/blocs/filters/filters_cubit.dart';
import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin GlobalBlocsMixin<T extends StatefulWidget> on State<T> {
  @protected
  FiltersCubit get filtersCubit => BlocProvider.of<FiltersCubit>(context);

  @protected
  SpotsCubit get spotsCubit => BlocProvider.of<SpotsCubit>(context);
}
