import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/presentation/pages/home/home_cubit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BlocPageState<HomePage, HomeCubit> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HOME'),
      ),
    );
  }
}
