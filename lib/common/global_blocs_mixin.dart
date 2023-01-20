import 'package:app/blocs/spots/spots_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin GlobalBlocsMixin<T extends StatefulWidget> on State<T> {
  @protected
  SpotsBloc get spotsBloc => BlocProvider.of<SpotsBloc>(context);
}
