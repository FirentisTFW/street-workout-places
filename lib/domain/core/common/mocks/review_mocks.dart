import 'package:app/domain/models/review.dart';
import 'package:app/domain/models/reviewer.dart';

abstract final class ReviewMocks {
  const ReviewMocks._();

  static final reviews = [
    Review(
      badAspects: const ['Brak wysokiego drążka'],
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim',
      date: DateTime(2023),
      goodAspects: const ['Fajny materiał drążków', 'Grube drążki'],
      id: '0',
      title: 'Bardzo spoko placyk',
      reviewer: const Reviewer(
        email: 'andrzej@niepodam.pl',
        name: 'Andrzej',
      ),
      spotId: 1,
    ),
    Review(
      badAspects: const ['Dużo dzieci', 'Niskie drążki'],
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim',
      date: DateTime(2023),
      goodAspects: const ['Dużo drążków', 'Latem jest cień'],
      id: '0',
      title: 'Fajny, ale dużo dzieci',
      reviewer: const Reviewer(
        email: 'marek@niepodam.pl',
        name: 'Marek',
      ),
      spotId: 1,
    ),
  ];
}
