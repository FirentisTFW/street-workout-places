import 'package:app/domain/core/common/maps/i_map_coordinator.dart';
import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/core/errors/user_input/text_field_error.dart';
import 'package:app/domain/services/user_input_validation_service.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/mocks.dart';

void main() {
  late UserInputValidationService validationService;

  setUp(() {
    validationService = MockUserInputValidationService();
  });

  group('NewSpotFormCubitTest -', () {
    group('proceedToNextStep -', () {
      // TODO Uncomment and test when the workaround for UnqiueProp is ready
      // blocTest<NewSpotFormCubit, NewSpotFormState>(
      //   'When all input fields are valid, emits _ValidationSuccesful',
      //   setUp: () {
      //     when(() => validationService.validate(any())).thenReturn(true);
      //   },
      //   build: () => NewSpotFormCubit(
      //     mapCoordinator: IMapCoordinator.create(),
      //     userInputValidator: validationService,
      //   ),
      //   act: (cubit) => cubit.proceedToNextStep(),
      //   expect: () => [
      //     NewSpotFormState.validationSuccessful(),
      //   ],
      // );
      const BlankTextFieldError error = BlankTextFieldError();
      blocTest<NewSpotFormCubit, NewSpotFormState>(
        'When some input fields are not valid, emits _ValidationFailed',
        setUp: () {
          when(() => validationService.validate(any())).thenReturn(error);
        },
        build: () => NewSpotFormCubit(
          mapCoordinator: IMapCoordinator.create(),
          userInputValidator: validationService,
        ),
        act: (cubit) => cubit.proceedToNextStep(),
        expect: () => [
          NewSpotFormValidationFailed(
            error: DialogError.fromException(error),
          ),
        ],
      );
    });
  });
}
