import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/data/repository/user_repository_impl.dart';
import 'package:flutter_testing/domain/models/filter_model.dart';
import 'package:flutter_testing/domain/models/user_model.dart';
import 'package:flutter_testing/domain/repository/user_repository.dart';

void main() {
  group('user repository', () {
    late final UserRepository repository;

    setUpAll(() {
      repository = UserRepositoryImpl();
    });

    test('get users positive case', () async {
      final resultUsers = await repository.getUsers(const FilterModel(page: 2));

      resultUsers.fold((l) {
        expect(l.message, 'Something when wrong');
      }, (r) {
        expect(r.data, isNotEmpty);
        expect(r.data, isA<List<UserModel>>());
        expect(r.data, isInstanceOf<List<UserModel>>());
      });
    });

    test('get users negative case', () async {
      final resultUsers = await repository.getUsers(const FilterModel(page: 3));

      resultUsers.fold((l) {
        expect(l.message, 'Something when wrong');
      }, (r) {
        expect(r.data, isEmpty);
      });
    });
  });
}
