import 'package:flutter_testing/data/mapper/user_mapper.dart';
import 'package:flutter_testing/data/source/local/floor/app_database.dart';
import 'package:flutter_testing/data/source/local/floor/user/user_dao.dart';
import 'package:flutter_testing/domain/models/user_model.dart';

import 'user_local_data_source.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final AppDatabase _database;

  UserLocalDataSourceImpl(this._database);

  UserDao get _dao => _database.userDao;

  @override
  Future<List<UserModel>> getUsers() async {
    return (await _dao.getUsers()).map(UserMapper.toModel).toList();
  }

  @override
  Future<bool> insertOne(UserModel user) => _dao
      .insertOne(UserMapper.toFloor(user))
      .then((_) => true)
      .catchError((_) => false);
}
