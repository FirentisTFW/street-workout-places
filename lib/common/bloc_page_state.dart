import 'package:app/common/global_blocs_mixin.dart';
import 'package:app/common/page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocPageState<W extends StatefulWidget, B extends Bloc> extends PageState<W> with GlobalBlocsMixin {
  @protected
  late final B bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<B>(context);
  }
}
