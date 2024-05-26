import 'package:flutter/foundation.dart';

@immutable
final class FilterModel {
  final int page;

  const FilterModel({
    this.page = 1,
  });

  FilterModel copyWith({int? page}) {
    return FilterModel(
      page: page ?? this.page,
    );
  }
}
