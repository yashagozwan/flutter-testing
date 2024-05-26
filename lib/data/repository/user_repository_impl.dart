import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_testing/domain/models/filter_model.dart';
import 'package:flutter_testing/domain/models/result.dart';
import 'package:flutter_testing/domain/models/user_model.dart';
import 'package:flutter_testing/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository, env: [Environment.prod])
final class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<ResultFailure, ResultSuccess<List<UserModel>>>> getUsers(
    FilterModel filter,
  ) async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=${filter.page}'),
    );

    if (response.statusCode != 200) {
      return Left(ResultFailure(
        message: 'Something when wrong',
        statusCode: response.statusCode,
      ));
    }

    final rawData = jsonDecode(response.body) as Map<String, dynamic>;
    final rawUsers = rawData['data'] as List<dynamic>;

    return Right(
      ResultSuccess(
        data: rawUsers.map((e) => UserModel.fromJson(e)).toList(),
      ),
    );
  }
}
