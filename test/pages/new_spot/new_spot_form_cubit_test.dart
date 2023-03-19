import 'package:app/common/maps/i_map_coordinator.dart';
import 'package:app/pages/new_spot/new_spot_form_cubit.dart';
import 'package:app/services/user_input_validation_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';

void main() {
  late UserInputValidationService validationService;

  setUp(() {
    validationService = MockUserInputValidationService();
  });

  group('NewSpotFormCubitTest -', () {
    group('proceedToNextStep -', () {
      blocTest<NewSpotFormCubit, NewSpotFormState>(
        'When all input fields are valid, emits _ValidationSuccesful',
        setUp: () {
          when(() => validationService.validate(any())).thenReturn(true);
        },
        build: () => NewSpotFormCubit(
          mapCoordinator: IMapCoordinator.create(),
          userInputValidator: validationService,
        ),
        act: (cubit) => cubit.proceedToNextStep(),
        expect: () => const [
          NewSpotFormState.validationSuccessful(),
        ],
      );
      const String failureMessage = 'Example failure message';
      blocTest<NewSpotFormCubit, NewSpotFormState>(
        'When some input fields are not valid, emits _ValidationFailed',
        setUp: () {
          when(() => validationService.validate(any())).thenReturn(false);
          when(() => validationService.failureMessage).thenReturn(failureMessage);
        },
        build: () => NewSpotFormCubit(
          mapCoordinator: IMapCoordinator.create(),
          userInputValidator: validationService,
        ),
        act: (cubit) => cubit.proceedToNextStep(),
        expect: () => const [
          NewSpotFormState.validationFailed(
            message: failureMessage,
          ),
        ],
      );
    });
  });
}
