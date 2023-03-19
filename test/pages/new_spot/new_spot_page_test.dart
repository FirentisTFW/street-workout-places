import 'package:app/common/app_locales.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/pages/new_spot/new_spot_form_cubit.dart';
import 'package:app/pages/new_spot/new_spot_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/mocks.dart';

void main() {
  late NewSpotFormCubit newSpotCubit;

  setUp(() {
    return newSpotCubit = MockNewSpotCubit();
  });

  // ignore: unused_element
  Widget provideTetablePage() {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: AppLocales.supportedLocales,
      home: BlocProvider.value(
        value: newSpotCubit,
        child: const NewSpotFormPage(),
      ),
    );
  }

  group('NewSpotPageTest -', () {
    // TODO Implement
  });
}
