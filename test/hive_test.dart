import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/data/source/local/hive/hive_adapter.dart';
import 'package:flutter_testing/data/source/local/hive/user/user_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';

void main() {
  HiveAdapter.init();

  group('Hive Test', () {
    setUpAll(() async {
      await setUpTestHive();
    });

    tearDownAll(() async {
      await tearDownTestHive();
    });

    test('test empty user', () async {
      final box = await Hive.openBox<UserHive>('users');
      final users = box.values.toList();
      expect(users, isEmpty);
    });

    test('get users', () async {
      final box = await Hive.openBox<UserHive>('users');

      final user = UserHive(
        id: 1,
        email: 'yasha@gmail.com',
        firstName: 'Yasha',
        lastName: 'Gozwan',
        avatar: 'google.com',
      );

      final user2 = UserHive(
        id: 1,
        email: 'yasha@gmail.com',
        firstName: 'Yasha',
        lastName: 'Gozwan',
        avatar: 'google.com',
      );

      final result = await box.add(user);
      expect(result, 0);
      final result2 = await box.add(user2);
      expect(result2, 1);
      final users = box.values.toList();
      expect(users, isNotEmpty);
      expect(users.first.id, 1);
      expect(users.first.email, 'yasha@gmail.com');
      expect(users.first.firstName, 'Yasha');
      expect(users.first.lastName, 'Gozwan');
      expect(users.first.avatar, 'google.com');
    });
  });
}
