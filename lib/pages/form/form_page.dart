import 'package:app/common/bloc_page_state.dart';
import 'package:app/pages/form/form_bloc.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    super.key,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends BlocPageState<FormPage, FormBloc> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('FORM'),
      ),
    );
  }
}
