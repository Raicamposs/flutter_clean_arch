import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String pictureUrl;
  final String email;
  final DateTime bornDate;

  User({
    required this.name,
    required this.pictureUrl,
    required this.email,
    required this.bornDate,
  });

  @override
  List<Object?> get props => [name, pictureUrl, email, bornDate];
}
