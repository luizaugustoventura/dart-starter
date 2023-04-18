import 'dart:convert';
import 'package:meta/meta.dart';

@sealed
class Person {
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName);
}

class UserModel {
  final String firstName;
  final String lastName;
  final String fullName;

  const UserModel(this.firstName, this.lastName) : fullName = '$firstName $lastName';

  UserModel.fromJson(Map json) : this(json['firstName'], json['lastName']);

  factory UserModel.fromJsonString(String json) {
    final map = jsonDecode(json);
    return UserModel.fromJson(map);
  }
}

abstract class UseCase {
  void execute();
}

main() {
  const u1 = UserModel('Luiz', 'Ventura');
  const u2 = UserModel('Luiz', 'Ventura');

  print(identical(u1, u2));
}