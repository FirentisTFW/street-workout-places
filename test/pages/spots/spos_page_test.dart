import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:app/domain/core/common/app_locales.dart';
import 'package:app/domain/core/errors/app_error.dart';
import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/pages/spots/spots_page.dart';
import 'package:app/presentation/widgets/app_progress_indicator.dart';
import 'package:app/presentation/widgets/app_text_field.dart';
import 'package:app/presentation/widgets/error_view_big.dart';
import 'package:app/presentation/widgets/spots_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../../helpers/mocks.dart';

void main() {
  late SpotsCubit spotsCubit;

  setUp(() {
    return spotsCubit = MockSpotsCubit();
  });

  Widget provideTestablePage() {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: AppLocales.supportedLocales,
      home: BlocProvider.value(
        value: spotsCubit,
        child: const SpotsPage(),
      ),
    );
  }

  group('SposPageTest -', () {
    patrolTest(
      'When fecthing spots is in progress, shows progress indicator',
      ($) async {
        when(() => spotsCubit.state).thenReturn(const SpotsFetchInProgress());

        await $.pumpWidget(provideTestablePage());
        await $.pump();

        expect(find.byType(AppProgressIndicator), equals(findsOneWidget));
      },
    );
    patrolTest(
      'When spots are fetched, shows a loaded page',
      ($) async {
        when(() => spotsCubit.state).thenReturn(
          const SpotsFetchSuccess(
            spots: [],
            filteredSpots: [],
          ),
        );

        await $.pumpWidgetAndSettle(provideTestablePage());

        expect(find.byType(AppTextField), equals(findsOneWidget));
        expect(find.byType(PageView), equals(findsOneWidget));
        expect(find.byType(SpotsMap), equals(findsOneWidget));
      },
    );
    patrolTest(
      'When fetching spots fails, shows error page',
      ($) async {
        when(() => spotsCubit.state).thenReturn(
          const SpotsFetchFailure(
            error: ContainerError(UnknownError()),
          ),
        );

        await $.pumpWidgetAndSettle(provideTestablePage());

        expect(find.byType(ErrorViewBig), equals(findsOneWidget));
      },
    );
  });
}
