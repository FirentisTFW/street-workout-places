import 'package:app/domain/core/common/app_locales.dart';
import 'package:app/domain/core/common/maps/map_coordinator.dart';
import 'package:app/domain/services/user_input_validation_service.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form_cubit.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NewSpotFormCubit cubit;

  setUp(() {
    return cubit = NewSpotFormCubit(
      mapCoordinator: MapCoordinator.create(),
      userInputValidator: UserInputValidationService(),
    );
  });

  Widget provideTestablePage() {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: AppLocales.supportedLocales,
      home: BlocProvider.value(
        value: cubit,
        child: const NewSpotFormPage(),
      ),
    );
  }

  group('NewSpotFormCubitTest -', () {
    group('proceedToNextStep -', () {
      // FIXME Add keys to the page and implement test
      // patrolTest('When some input fields are not valid, shows error messages', ($) async {
      // await $.pumpWidget(provideTestablePage());

      // $.enterText(find.byKey(Key('cityTextField')), 'Poznan');
      // });
    });
  });
}
