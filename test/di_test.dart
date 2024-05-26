import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/di/di.dart';
import 'package:flutter_testing/domain/models/filter_model.dart';
import 'package:flutter_testing/domain/repository/user_repository.dart';

void main() {
  configureDependencies(env: 'test');

  group('User Repository', () {
    test("", () async {
      final repository = getIt.get<UserRepository>();
      final resultUser = await repository.getUsers(const FilterModel());
      resultUser.fold((l) {}, (r) {
        expect(r.data.first.firstName, 'Shuhada');
      });
    });
  });
}
