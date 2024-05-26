import 'package:floor/floor.dart';
import 'package:flutter_testing/data/source/local/floor/user/user_floor.dart';

@dao
abstract class UserDao {
  @insert
  Future<void> insertOne(UserFloor user);

  @Query('SELECT * FROM users')
  Future<List<UserFloor>> getUsers();
}
