import 'package:dartz/dartz.dart';
import 'package:flutter_testing/domain/models/filter_model.dart';
import 'package:flutter_testing/domain/models/result.dart';
import 'package:flutter_testing/domain/models/user_model.dart';

abstract class UserRepository {
  Future<Either<ResultFailure, ResultSuccess<List<UserModel>>>> getUsers(
    FilterModel filter,
  );
}
