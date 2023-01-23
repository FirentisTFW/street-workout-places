import 'package:app/blocs/spots/spots_bloc.dart';
import 'package:app/common/app_locales.dart';
import 'package:app/common/global_navigator.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/injector/injector.dart';
import 'package:app/repositories/spots/i_network_spots_repository.dart';
import 'package:app/routing/routing.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_text_styles.dart';
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
  late final SpotsBloc spotsBloc;

  @override
  void initState() {
    super.initState();
    spotsBloc = SpotsBloc(
      spotsRepository: Injector().resolve<INetworkSpotsRepository>(),
    );
    spotsBloc.add(
      const SpotsEvent.fetchSpotsRequested(),
    );
  }

  @override
  void dispose() {
    spotsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpotsBloc>.value(
      value: spotsBloc,
      child: MaterialApp(
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
          scaffoldBackgroundColor: AppColors.white,
        ),
      ),
    );
  }
}
