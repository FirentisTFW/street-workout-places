import 'dart:async';
import 'dart:ui';

import 'package:app/domain/core/common/constants.dart';

class QueryController {
  final Duration duration;
  String _lastQuery = '';
  Timer? _timer;

  QueryController({
    required this.duration,
  });

  QueryController.withDefaultDuration() : duration = Constants.search.queryTimerReaction;

  void updateQuery(
    String query, {
    required VoidCallback action,
  }) {
    if (query == _lastQuery) return;
    _lastQuery = query;
    _replaceAction(action);
  }

  void dispose() {
    _timer?.cancel();
  }

  void _replaceAction(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(
      duration,
      action.call,
    );
  }
}
