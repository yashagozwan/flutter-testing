import 'package:floor/floor.dart';

@Entity(tableName: 'users')
final class UserFloor {
  @primaryKey
  final int id;
  final String email;
  @ColumnInfo(name: 'first_name')
  final String firstName;
  @ColumnInfo(name: 'last_name')
  final String lastName;
  final String avatar;

  const UserFloor({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}
