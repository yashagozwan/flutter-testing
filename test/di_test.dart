import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/di/di.dart';
import 'package:flutter_testing/domain/models/filter_model.dart';
import 'package:flutter_testing/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart' as injectable;

void main() {
  configureDependencies(env: injectable.Environment.prod);

  group('User Repository', () {
    test("get users", () async {
      final repository = getIt.get<UserRepository>();
      final resultUser = await repository.getUsers(const FilterModel());
      resultUser.fold((l) {}, (r) {
        expect(r.data.first.firstName, 'George');
      });
    });
  });
}
