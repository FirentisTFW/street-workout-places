import 'dart:async';
import 'dart:ui';

import 'package:app/common/constants.dart';

class QueryHandler {
  final Duration duration;
  String _lastQuery = '';
  Timer? _timer;

  QueryHandler({
    required this.duration,
  });

  QueryHandler.withDefaultDuration() : duration = Constants.search.queryTimerReaction;

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
