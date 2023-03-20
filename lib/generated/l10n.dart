// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Street Workout Spots`
  String get appName {
    return Intl.message(
      'Street Workout Spots',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Zgłoś`
  String get dashboardTabForm {
    return Intl.message(
      'Zgłoś',
      name: 'dashboardTabForm',
      desc: '',
      args: [],
    );
  }

  /// `Więcej`
  String get dashboardTabMore {
    return Intl.message(
      'Więcej',
      name: 'dashboardTabMore',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get dashboardTabHome {
    return Intl.message(
      'Home',
      name: 'dashboardTabHome',
      desc: '',
      args: [],
    );
  }

  /// `Punkty`
  String get dashboardTabSpots {
    return Intl.message(
      'Punkty',
      name: 'dashboardTabSpots',
      desc: '',
      args: [],
    );
  }

  /// `Mapa`
  String get spotsMapTabBarButtonTitle {
    return Intl.message(
      'Mapa',
      name: 'spotsMapTabBarButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lista`
  String get spotsListTabBarButtonTitle {
    return Intl.message(
      'Lista',
      name: 'spotsListTabBarButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Szukaj`
  String get search {
    return Intl.message(
      'Szukaj',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Duży`
  String get workoutSpotSizeDescriptionBig {
    return Intl.message(
      'Duży',
      name: 'workoutSpotSizeDescriptionBig',
      desc: '',
      args: [],
    );
  }

  /// `Średni`
  String get workoutSpotSizeDescriptionMedium {
    return Intl.message(
      'Średni',
      name: 'workoutSpotSizeDescriptionMedium',
      desc: '',
      args: [],
    );
  }

  /// `Mały`
  String get workoutSpotSizeDescriptionSmall {
    return Intl.message(
      'Mały',
      name: 'workoutSpotSizeDescriptionSmall',
      desc: '',
      args: [],
    );
  }

  /// `Rozmiar: {size}`
  String sizeSelected(Object size) {
    return Intl.message(
      'Rozmiar: $size',
      name: 'sizeSelected',
      desc: '',
      args: [size],
    );
  }

  /// `Nawiguj`
  String get navigationButtonTitle {
    return Intl.message(
      'Nawiguj',
      name: 'navigationButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Ta funkcja jest jeszcze niedostępna. Pracujmy nad nią :)`
  String get contentUnavailableDialogMessage {
    return Intl.message(
      'Ta funkcja jest jeszcze niedostępna. Pracujmy nad nią :)',
      name: 'contentUnavailableDialogMessage',
      desc: '',
      args: [],
    );
  }

  /// `Funkcja niedostępna`
  String get contentUnavailableDialogTitle {
    return Intl.message(
      'Funkcja niedostępna',
      name: 'contentUnavailableDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Drążek wysoki`
  String get equipmentDescriptionHighBar {
    return Intl.message(
      'Drążek wysoki',
      name: 'equipmentDescriptionHighBar',
      desc: '',
      args: [],
    );
  }

  /// `Drabinka pozioma`
  String get equipmentDescriptionHorizontalLadder {
    return Intl.message(
      'Drabinka pozioma',
      name: 'equipmentDescriptionHorizontalLadder',
      desc: '',
      args: [],
    );
  }

  /// `Drążek niski`
  String get equipmentDescriptionLowBar {
    return Intl.message(
      'Drążek niski',
      name: 'equipmentDescriptionLowBar',
      desc: '',
      args: [],
    );
  }

  /// `Poręcze równoległe`
  String get equipmentDescriptionParallelBars {
    return Intl.message(
      'Poręcze równoległe',
      name: 'equipmentDescriptionParallelBars',
      desc: '',
      args: [],
    );
  }

  /// `Ścianki do parkour`
  String get equipmentDescriptionParkourWalls {
    return Intl.message(
      'Ścianki do parkour',
      name: 'equipmentDescriptionParkourWalls',
      desc: '',
      args: [],
    );
  }

  /// `Rurka pionowa`
  String get equipmentDescriptionPole {
    return Intl.message(
      'Rurka pionowa',
      name: 'equipmentDescriptionPole',
      desc: '',
      args: [],
    );
  }

  /// `Obręcze gimnastczne`
  String get equipmentDescriptionRings {
    return Intl.message(
      'Obręcze gimnastczne',
      name: 'equipmentDescriptionRings',
      desc: '',
      args: [],
    );
  }

  /// `Lina`
  String get equipmentDescriptionRope {
    return Intl.message(
      'Lina',
      name: 'equipmentDescriptionRope',
      desc: '',
      args: [],
    );
  }

  /// `Drabinka pionowa`
  String get equipmentDescriptionVerticalLadder {
    return Intl.message(
      'Drabinka pionowa',
      name: 'equipmentDescriptionVerticalLadder',
      desc: '',
      args: [],
    );
  }

  /// `Beton`
  String get surfaceDescriptionConcrete {
    return Intl.message(
      'Beton',
      name: 'surfaceDescriptionConcrete',
      desc: '',
      args: [],
    );
  }

  /// `Inne`
  String get surfaceDescriptionDifferent {
    return Intl.message(
      'Inne',
      name: 'surfaceDescriptionDifferent',
      desc: '',
      args: [],
    );
  }

  /// `Piasek`
  String get surfaceDescriptionSand {
    return Intl.message(
      'Piasek',
      name: 'surfaceDescriptionSand',
      desc: '',
      args: [],
    );
  }

  /// `Tartan`
  String get surfaceDescriptionTartan {
    return Intl.message(
      'Tartan',
      name: 'surfaceDescriptionTartan',
      desc: '',
      args: [],
    );
  }

  /// `Map data from OpenStreetMap`
  String get mapDataSourceOpenStreetMap {
    return Intl.message(
      'Map data from OpenStreetMap',
      name: 'mapDataSourceOpenStreetMap',
      desc: '',
      args: [],
    );
  }

  /// `Rozmiar`
  String get size {
    return Intl.message(
      'Rozmiar',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Podłoże`
  String get surface {
    return Intl.message(
      'Podłoże',
      name: 'surface',
      desc: '',
      args: [],
    );
  }

  /// `Nazwa`
  String get name {
    return Intl.message(
      'Nazwa',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Miasto`
  String get city {
    return Intl.message(
      'Miasto',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Ulica`
  String get street {
    return Intl.message(
      'Ulica',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Nr domu`
  String get hosueNumber {
    return Intl.message(
      'Nr domu',
      name: 'hosueNumber',
      desc: '',
      args: [],
    );
  }

  /// `Opis`
  String get description {
    return Intl.message(
      'Opis',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Szer. geogr.`
  String get latitudeShort {
    return Intl.message(
      'Szer. geogr.',
      name: 'latitudeShort',
      desc: '',
      args: [],
    );
  }

  /// `Dł. geogr.`
  String get longitudeShort {
    return Intl.message(
      'Dł. geogr.',
      name: 'longitudeShort',
      desc: '',
      args: [],
    );
  }

  /// `Zaznacz miejsce na mapie`
  String get newSpotCoordinatesSectionButtonTitle {
    return Intl.message(
      'Zaznacz miejsce na mapie',
      name: 'newSpotCoordinatesSectionButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Zapisz`
  String get save {
    return Intl.message(
      'Zapisz',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Zaznacz lokalizację parku. Możesz przybliżyć mapę, by zwiększyć dokładność.`
  String get selectLocationOnMapDescription {
    return Intl.message(
      'Zaznacz lokalizację parku. Możesz przybliżyć mapę, by zwiększyć dokładność.',
      name: 'selectLocationOnMapDescription',
      desc: '',
      args: [],
    );
  }

  /// `Dalej`
  String get next {
    return Intl.message(
      'Dalej',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `To pole nie może być puste`
  String get blankTextFieldErrorMessage {
    return Intl.message(
      'To pole nie może być puste',
      name: 'blankTextFieldErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Należy wybrać wartość`
  String get emptyValueNotifierErrorMessage {
    return Intl.message(
      'Należy wybrać wartość',
      name: 'emptyValueNotifierErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Należy wybrać lokalizację punktu na mapie`
  String get notSelectedMapPositionValueNotifierErrorMessage {
    return Intl.message(
      'Należy wybrać lokalizację punktu na mapie',
      name: 'notSelectedMapPositionValueNotifierErrorMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
