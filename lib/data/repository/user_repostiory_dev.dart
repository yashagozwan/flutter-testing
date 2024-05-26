import 'package:dartz/dartz.dart';
import 'package:flutter_testing/domain/models/filter_model.dart';
import 'package:flutter_testing/domain/models/result.dart';
import 'package:flutter_testing/domain/models/user_model.dart';
import 'package:flutter_testing/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserRepository, env: [Environment.test])
class UserRepositoryDev implements UserRepository {
  @override
  Future<Either<ResultFailure, ResultSuccess<List<UserModel>>>> getUsers(
    FilterModel filter,
  ) async {
    return const Right(ResultSuccess(
      data: [
        UserModel(
          id: 1,
          email: 'gozwan@gmail.com',
          firstName: 'Shuhada',
          lastName: 'Gozwan',
          avatar: 'google.com',
        ),
      ],
    ));
  }
}
