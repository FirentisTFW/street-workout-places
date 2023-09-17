import 'package:equatable/equatable.dart';

class Reviewer extends Equatable {
  final String email;
  final String name;

  const Reviewer({
    required this.email,
    required this.name,
  });

  @override
  List<Object?> get props => [
        email,
        name,
      ];
}
