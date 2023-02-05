import 'package:app/extensions/extensions.dart';

abstract class TextUtils {
  const TextUtils._();

  static const Map<String, String> _polishDiacritics = {
    'ą': 'a',
    'ć': 'c',
    'ę': 'e',
    'ł': 'l',
    'ń': 'n',
    'ó': 'o',
    'ś': 's',
    'ź': 'z',
    'ż': 'z',
  };

  static String removeDiacritics(String text) {
    final List<String> textLetters = text.split('');
    return textLetters.map(
      (letter) {
        if (letter.isLowerCase) {
          return _polishDiacritics[letter] ?? letter;
        }
        return _polishDiacritics[letter.toLowerCase()]?.toUpperCase() ?? letter;
      },
    ).join();
  }
}
