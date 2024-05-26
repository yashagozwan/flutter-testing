import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/data/source/local/floor/app_database.dart';
import 'package:flutter_testing/data/source/local/user_local_data_source.dart';
import 'package:flutter_testing/data/source/local/user_local_data_source_impl.dart';
import 'package:flutter_testing/domain/models/user_model.dart';

void main() {
  group('User Local Data Source', () {
    late final AppDatabase database;
    late final UserLocalDataSource local;

    setUpAll(() async {
      database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
      local = UserLocalDataSourceImpl(database);
    });

    tearDownAll(() {
      database.close();
    });

    test('get users', () async {
      final users = await local.getUsers();
      expect(users, isEmpty);
    });

    test('insert one user', () async {
      // arrange
      const user = UserModel(
        id: 1,
        email: 'yasha@gmail.com',
        firstName: 'Yasha',
        lastName: 'Gozwan',
        avatar:
            'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      );

      // act
      final result = await local.insertOne(user);
      final mUser = (await local.getUsers()).first;

      // assert
      expect(result, true);
      expect(mUser.firstName, user.firstName);
      expect(mUser.email, user.email);
      expect(mUser.firstName, user.firstName);
      expect(mUser.lastName, user.lastName);
      expect(mUser.avatar, user.avatar);
    });
  });
}
