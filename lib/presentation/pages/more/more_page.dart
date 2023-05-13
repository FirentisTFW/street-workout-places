import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/presentation/pages/more/more_cubit.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({
    super.key,
  });

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends BlocPageState<MorePage, MoreCubit> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MORE'),
      ),
    );
  }
}
