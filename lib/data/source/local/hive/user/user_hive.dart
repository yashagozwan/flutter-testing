import 'package:hive_flutter/hive_flutter.dart';

part 'user_hive.g.dart';

@HiveType(typeId: 1)
class UserHive extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String firstName;
  @HiveField(3)
  String lastName;
  @HiveField(4)
  String avatar;

  UserHive({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}
