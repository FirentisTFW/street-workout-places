import 'package:app/domain/models/reviewer.dart';
import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final List<String> badAspects;
  final String content;
  final DateTime date;
  final List<String> goodAspects;
  final String id;
  final String title;
  final Reviewer reviewer;

  const Review({
    required this.badAspects,
    required this.content,
    required this.date,
    required this.goodAspects,
    required this.id,
    required this.title,
    required this.reviewer,
  });

  @override
  List<Object?> get props => [
        badAspects,
        content,
        goodAspects,
        id,
        title,
        reviewer,
      ];
}
