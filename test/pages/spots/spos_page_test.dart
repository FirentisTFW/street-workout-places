import 'package:app/blocs/spots/spots_cubit.dart';
import 'package:app/common/app_locales.dart';
import 'package:app/errors/app_error.dart';
import 'package:app/errors/ui_error.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/pages/spots/spots_page.dart';
import 'package:app/widgets/app_progress_indicator.dart';
import 'package:app/widgets/app_text_field.dart';
import 'package:app/widgets/error_view_big.dart';
import 'package:app/widgets/spots_map.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpotsCubit extends MockCubit<SpotsState> implements SpotsCubit {}

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
    testWidgets(
      'When fecthing spots is in progress, shows progress indicator',
      (tester) async {
        when(() => spotsCubit.state).thenReturn(const SpotsState.fetchSpotsInProgress());

        await tester.pumpWidget(provideTestablePage());
        await tester.pump();

        expect(find.byType(AppProgressIndicator), equals(findsOneWidget));
      },
    );
    testWidgets(
      'When spots are fetched, shows a loaded page',
      (tester) async {
        when(() => spotsCubit.state).thenReturn(
          const SpotsState.fetchSpotsSuccess(
            spots: [],
            filteredSpots: [],
          ),
        );

        await tester.pumpWidget(provideTestablePage());
        await tester.pumpAndSettle();

        expect(find.byType(AppTextField), equals(findsOneWidget));
        expect(find.byType(PageView), equals(findsOneWidget));
        expect(find.byType(SpotsMap), equals(findsOneWidget));
      },
    );
    testWidgets(
      'When fetching spots fails, shows error page',
      (tester) async {
        when(() => spotsCubit.state).thenReturn(
          const SpotsState.fetchSpotsFailure(
            error: ContainerError(UnknownError()),
          ),
        );

        await tester.pumpWidget(provideTestablePage());
        await tester.pumpAndSettle();

        expect(find.byType(ErrorViewBig), equals(findsOneWidget));
      },
    );
  });
}
