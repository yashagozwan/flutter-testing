import 'package:flutter_testing/domain/models/user_model.dart';

abstract class UserLocalDataSource {
  Future<bool> insertOne(UserModel user);

  Future<List<UserModel>> getUsers();
}
