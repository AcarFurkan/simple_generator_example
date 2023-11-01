// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// SimpleGenerator
// **************************************************************************

extension UserToJson on User {
  Map<String, dynamic> toJson() => {'name': name, 'age': age};
}

extension UserFromJson on Map<String, dynamic> {
  User toUser() => User(name: this['name'], age: this['age']);
}

// Hello from SimpleGenerator
