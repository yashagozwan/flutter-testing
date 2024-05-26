import 'package:flutter/material.dart';
import 'package:flutter_testing/domain/models/filter_model.dart';
import 'package:flutter_testing/domain/models/user_model.dart';
import 'package:flutter_testing/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
final class UserViewModel extends ChangeNotifier {
  UserViewModel(this._repository);

  final UserRepository _repository;

  FilterModel _filter = const FilterModel();

  FilterModel get filter => _filter;

  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  bool _isUsersLoading = false;

  bool get isUsersLoading => _isUsersLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void setErrorMessage(String? errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  void setIsUserLoading(bool isUsersLoading) {
    _isUsersLoading = isUsersLoading;
    notifyListeners();
  }

  void setUsers(List<UserModel> users) {
    _users = users;
    notifyListeners();
  }

  void setFilter(FilterModel filter) {
    _filter = filter;
    notifyListeners();
  }

  void getUsers() async {
    setIsUserLoading(true);
    final userResult = await _repository.getUsers(filter);
    userResult.fold((left) {
      setErrorMessage(left.message);
      setIsUserLoading(false);
    }, (right) {
      setUsers(right.data);
      setIsUserLoading(false);
    });
  }

  void initial() async {
    getUsers();
  }
}
