import 'package:app/application/blocs/filters/filters_cubit.dart';
import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:app/domain/core/common/app_locales.dart';
import 'package:app/domain/core/common/global_navigator.dart';
import 'package:app/domain/services/filters_validation_service.dart';
import 'package:app/domain/services/spots_filtering_service.dart';
import 'package:app/domain/services/user_location_service.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/infrastructure/repositories/spots/network_spots_repository.dart';
import 'package:app/injector.dart';
import 'package:app/presentation/routing/routing.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppEntry extends StatefulWidget {
  const AppEntry({
    super.key,
  });

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  late final FiltersCubit filtersCubit;
  late final SpotsCubit spotsCubit;

  @override
  void initState() {
    super.initState();
    filtersCubit = FiltersCubit(
      filtersValidator: FiltersValidationService(),
      userLocationService: UserLocationService(),
    );
    spotsCubit = SpotsCubit(
      filtersCubit: filtersCubit,
      spotsRepository: Injector().resolve<NetworkSpotsRepository>(),
      spotsFilteringService: SpotsFilteringService(),
    );
    spotsCubit.fetchSpots();
  }

  @override
  void dispose() {
    filtersCubit.close();
    spotsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: spotsCubit,
        ),
        BlocProvider.value(
          value: filtersCubit,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routing.dashboard,
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          S.delegate,
        ],
        navigatorKey: Injector().resolve<GlobalNavigator>().navigatorKey,
        supportedLocales: AppLocales.supportedLocales,
        onGenerateRoute: Routing.getRoute,
        onGenerateTitle: (context) => S.of(context).appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: AppColors.blue,
          ),
          cupertinoOverrideTheme: CupertinoTheme.of(context).copyWith(
            primaryColor: AppColors.black,
            textTheme: const CupertinoTextThemeData(
              textStyle: TextStyle(
                color: AppColors.black,
              ),
            ),
          ),
          fontFamily: AppTextStyles.robotoFontFamily,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.white,
        ),
      ),
    );
  }
}
