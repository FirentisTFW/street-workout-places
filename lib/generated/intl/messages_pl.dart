// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pl';

  static String m0(value) =>
      "Maksymalna liczba zdjęć, które można dodać, to ${value}.";

  static String m1(size) => "Rozmiar: ${size}";

  static String m2(distance) => "${distance} km";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Parki Street Workout"),
        "blankTextFieldErrorMessage":
            MessageLookupByLibrary.simpleMessage("To pole nie może być puste"),
        "cancel": MessageLookupByLibrary.simpleMessage("Anuluj"),
        "city": MessageLookupByLibrary.simpleMessage("Miasto"),
        "contentUnavailableDialogMessage": MessageLookupByLibrary.simpleMessage(
            "Ta funkcja jest jeszcze niedostępna. Pracujmy nad nią :)"),
        "contentUnavailableDialogTitle":
            MessageLookupByLibrary.simpleMessage("Funkcja niedostępna"),
        "dashboardTabForm": MessageLookupByLibrary.simpleMessage("Zgłoś"),
        "dashboardTabHome": MessageLookupByLibrary.simpleMessage("Home"),
        "dashboardTabMore": MessageLookupByLibrary.simpleMessage("Więcej"),
        "dashboardTabSpots": MessageLookupByLibrary.simpleMessage("Punkty"),
        "description": MessageLookupByLibrary.simpleMessage("Opis"),
        "emptyValueNotifierErrorMessage":
            MessageLookupByLibrary.simpleMessage("Należy wybrać wartość"),
        "equipment": MessageLookupByLibrary.simpleMessage("Sprzęt"),
        "equipmentDescriptionHighBar":
            MessageLookupByLibrary.simpleMessage("Drążek wysoki"),
        "equipmentDescriptionHorizontalLadder":
            MessageLookupByLibrary.simpleMessage("Drabinka pozioma"),
        "equipmentDescriptionLowBar":
            MessageLookupByLibrary.simpleMessage("Drążek niski"),
        "equipmentDescriptionParallelBars":
            MessageLookupByLibrary.simpleMessage("Poręcze równoległe"),
        "equipmentDescriptionParkourWalls":
            MessageLookupByLibrary.simpleMessage("Ścianki do parkour"),
        "equipmentDescriptionPole":
            MessageLookupByLibrary.simpleMessage("Rurka pionowa"),
        "equipmentDescriptionRings":
            MessageLookupByLibrary.simpleMessage("Obręcze gimnastczne"),
        "equipmentDescriptionRope":
            MessageLookupByLibrary.simpleMessage("Lina"),
        "equipmentDescriptionVerticalLadder":
            MessageLookupByLibrary.simpleMessage("Drabinka pionowa"),
        "filtersAppBarTitle": MessageLookupByLibrary.simpleMessage("Filtruj"),
        "filtersClearButtonTitle":
            MessageLookupByLibrary.simpleMessage("Wyczyść"),
        "filtersFilterButtonTitle":
            MessageLookupByLibrary.simpleMessage("Filtruj"),
        "filtersMaxDistanceInKm":
            MessageLookupByLibrary.simpleMessage("Maksymalna odległość (w km)"),
        "filtersMissingLocationPermissionDialogMessage":
            MessageLookupByLibrary.simpleMessage(
                "Aby filtrować place na podstawie odległości, aplikacja potrzebuje dostępu do uprawnień lokalizacji."),
        "filtersMissingLocationPermissionDialogSettingsButton":
            MessageLookupByLibrary.simpleMessage("Ustawienia lokalizacji"),
        "filtersMissingLocationPermissionDialogTitle":
            MessageLookupByLibrary.simpleMessage("Brak dostępu do lokalizacji"),
        "filtersMissingLocationPermissionDialogTitleFilterWithoutDistanceButton":
            MessageLookupByLibrary.simpleMessage("Filtruj bez odległości"),
        "hosueNumber": MessageLookupByLibrary.simpleMessage("Nr domu"),
        "kilometersAbbreviation": MessageLookupByLibrary.simpleMessage("km"),
        "latitudeShort": MessageLookupByLibrary.simpleMessage("Szer. geogr."),
        "longitudeShort": MessageLookupByLibrary.simpleMessage("Dł. geogr."),
        "mapDataSourceOpenStreetMap":
            MessageLookupByLibrary.simpleMessage("Map data from OpenStreetMap"),
        "name": MessageLookupByLibrary.simpleMessage("Nazwa"),
        "navigationButtonTitle":
            MessageLookupByLibrary.simpleMessage("Nawiguj"),
        "newSpotCoordinatesSectionButtonTitle":
            MessageLookupByLibrary.simpleMessage("Zaznacz miejsce na mapie"),
        "newSpotEquipmentAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Zgłoś plac 2/3"),
        "newSpotEquipmentHeadline": MessageLookupByLibrary.simpleMessage(
            "Wybierz z listy sprzęt, który znajduje się w opisywanym miejscu."),
        "newSpotFormAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Zgłoś plac 1/3"),
        "newSpotFormRequiredFieldInformation":
            MessageLookupByLibrary.simpleMessage("* Pole wymagane"),
        "newSpotImageCellDefault":
            MessageLookupByLibrary.simpleMessage("Domyślne"),
        "newSpotImageCellSetAsDefault":
            MessageLookupByLibrary.simpleMessage("Ustaw jako domyślne"),
        "newSpotImagesAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Zgłoś plac 3/3"),
        "newSpotImagesHeadline": MessageLookupByLibrary.simpleMessage(
            "Dodaj co najmniej dwa zdjęcia opisywanego miejsca. Zdjęcie wybrane jako domyślne będzie pokazywać się w pierwszej kolejności, np. jako miniaturka parku na listach."),
        "newSpotImagesMaxImageCountInformation": m0,
        "newSpotInitialDescription": MessageLookupByLibrary.simpleMessage(
            "Znasz dobrą miejscówkę treningową? Podziel się nią z innymi!"),
        "newSpotInitialHeader":
            MessageLookupByLibrary.simpleMessage("Dodaj nową lokację"),
        "newSpotInitialNextButtonTitle":
            MessageLookupByLibrary.simpleMessage("Chcę dodać lokację"),
        "newSpotSubmittedDialogMessage": MessageLookupByLibrary.simpleMessage(
            "Dane zostały przekazane do weryfikacji. Dzięki za podzielenie się tą miejscówką!"),
        "newSpotSubmittedDialogTitle":
            MessageLookupByLibrary.simpleMessage("Plac zgłoszony"),
        "next": MessageLookupByLibrary.simpleMessage("Dalej"),
        "noNetworkConnectionErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Brak połączenia z internetem."),
        "noUserPositionProvidedForFiltersErrorMessage":
            MessageLookupByLibrary.simpleMessage(
                "Aby filtrować na podstawie dystansu, aplikacja potrzebuje dostępu do lokalizacji użytkownika."),
        "notNumberTextFieldErrorMessage":
            MessageLookupByLibrary.simpleMessage("Należy wprowadzić liczbę"),
        "notSelectedAnyEquipmentItemErrorMessage":
            MessageLookupByLibrary.simpleMessage(
                "Nie wybrano żadnego sprzętu."),
        "notSelectedMapPositionValueNotifierErrorMessage":
            MessageLookupByLibrary.simpleMessage(
                "Należy wybrać lokalizację punktu na mapie"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "save": MessageLookupByLibrary.simpleMessage("Zapisz"),
        "search": MessageLookupByLibrary.simpleMessage("Szukaj"),
        "selectLocationOnMapDescription": MessageLookupByLibrary.simpleMessage(
            "Zaznacz lokalizację parku. Możesz przybliżyć mapę, by zwiększyć dokładność."),
        "send": MessageLookupByLibrary.simpleMessage("Prześlij"),
        "size": MessageLookupByLibrary.simpleMessage("Rozmiar"),
        "sizeSelected": m1,
        "spotListCellDistanceFromUserInKm": m2,
        "spotsListTabBarButtonTitle":
            MessageLookupByLibrary.simpleMessage("Lista"),
        "spotsMapTabBarButtonTitle":
            MessageLookupByLibrary.simpleMessage("Mapa"),
        "street": MessageLookupByLibrary.simpleMessage("Ulica"),
        "surface": MessageLookupByLibrary.simpleMessage("Podłoże"),
        "surfaceDescriptionConcrete":
            MessageLookupByLibrary.simpleMessage("Beton"),
        "surfaceDescriptionDifferent":
            MessageLookupByLibrary.simpleMessage("Inne"),
        "surfaceDescriptionSand":
            MessageLookupByLibrary.simpleMessage("Piasek"),
        "surfaceDescriptionTartan":
            MessageLookupByLibrary.simpleMessage("Tartan"),
        "tooFewImagesSelectedErrorMessage":
            MessageLookupByLibrary.simpleMessage("Wybrano zbyt mało zdjęć."),
        "unknownErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Wystąpił błąd, spróbuj ponownie."),
        "workoutSpotSizeDescriptionBig":
            MessageLookupByLibrary.simpleMessage("Duży"),
        "workoutSpotSizeDescriptionMedium":
            MessageLookupByLibrary.simpleMessage("Średni"),
        "workoutSpotSizeDescriptionSmall":
            MessageLookupByLibrary.simpleMessage("Mały")
      };
}
