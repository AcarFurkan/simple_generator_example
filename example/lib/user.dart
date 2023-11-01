import 'package:annotation/annotation.dart';

part 'user.g.dart';

@SimpleAnnotation(addHello: true)
class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}
