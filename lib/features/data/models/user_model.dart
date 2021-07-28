import 'dart:convert';

import '../../../features/domain/entities/index.dart';

class UserModel extends User {
  UserModel({
    required String name,
    required String pictureUrl,
    required String email,
    required DateTime bornDate,
  }) : super(
          name: name,
          pictureUrl: pictureUrl,
          email: email,
          bornDate: bornDate,
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pictureUrl': pictureUrl,
      'email': email,
      'bornDate': bornDate.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      pictureUrl: map['pictureUrl'],
      email: map['email'],
      bornDate: DateTime.fromMillisecondsSinceEpoch(map['bornDate']),
    );
  }

  factory UserModel.fromFirebase(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      pictureUrl: map['picture_url'],
      email: map['email'],
      bornDate: DateTime.fromMillisecondsSinceEpoch(map['born_date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
