import 'package:app/common/app_locales.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/pages/new_spot/new_spot_cubit.dart';
import 'package:app/pages/new_spot/new_spot_page.dart';
import 'package:app/widgets/adaptive_button.dart';
import 'package:app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../../helpers/mocks.dart';

void main() {
  late NewSpotCubit newSpotCubit;

  setUp(() {
    return newSpotCubit = MockNewSpotCubit();
  });

  Widget provideTestablePage() {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: AppLocales.supportedLocales,
      home: BlocProvider.value(
        value: newSpotCubit,
        child: const NewSpotPage(),
      ),
    );
  }

  group('NewSpotPageTest -', () {
    patrolTest('Initial view', ($) async {
      when(() => newSpotCubit.state).thenReturn(const NewSpotState.initial());

      await $.pumpWidgetAndSettle(provideTestablePage());

      expect(find.byType(AppTextField), equals(findsNWidgets(7)));
      expect(find.byType(DropdownButton), equals(findsNWidgets(2)));
      expect(find.byType(AdaptiveButton), equals(findsNWidgets(1)));
    });
  });
}
