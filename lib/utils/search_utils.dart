import 'package:app/extensions/extensions.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/utils/text_utils.dart';

abstract class SearchUtils {
  const SearchUtils._();

  static bool checkIfSpotMatchesQuery({
    required WorkoutSpotModel spot,
    required String query,
  }) {
    final String queryWithoutDiacritics = TextUtils.removeDiacritics(query).toLowerCase();
    final List<String> queryWords = queryWithoutDiacritics.split(' ');
    final Iterable<String> spotLocationEssentials = [
      spot.name,
      spot.address?.city,
      spot.address?.street,
    ].filterNotNull().map((element) => TextUtils.removeDiacritics(element).toLowerCase());
    for (final String queryWord in queryWords) {
      final bool hasMatch = spotLocationEssentials.any((element) => element.contains(queryWord));
      if (hasMatch) return true;
    }
    return false;
  }
}
