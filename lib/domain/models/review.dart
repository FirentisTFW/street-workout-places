import 'package:app/domain/models/reviewer.dart';
import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final List<String> badAspects;
  final String content;
  final DateTime date;
  final List<String> goodAspects;
  final String id;
  final Reviewer reviewer;
  final int spotId;
  final String title;

  bool get hasAnyAspects => hasBadAspects || hasGoodAspects;

  bool get hasBadAspects => badAspects.isNotEmpty;

  bool get hasGoodAspects => goodAspects.isNotEmpty;

  const Review({
    required this.badAspects,
    required this.content,
    required this.date,
    required this.goodAspects,
    required this.id,
    required this.reviewer,
    required this.spotId,
    required this.title,
  });

  @override
  List<Object?> get props => [
        badAspects,
        content,
        date,
        goodAspects,
        id,
        reviewer,
        spotId,
        title,
      ];
}
