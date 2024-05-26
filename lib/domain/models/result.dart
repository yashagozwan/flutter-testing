import 'package:flutter/foundation.dart';

@immutable
sealed class Result {
  const Result();
}

final class ResultSuccess<T> extends Result {
  final T data;

  const ResultSuccess({
    required this.data,
  });
}

final class ResultFailure extends Result implements Exception {
  final String? message;
  final int? statusCode;

  const ResultFailure({
    required this.message,
    required this.statusCode,
  });
}
