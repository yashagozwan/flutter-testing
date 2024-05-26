import 'package:flutter_testing/data/source/local/floor/user/user_floor.dart';
import 'package:flutter_testing/domain/models/user_model.dart';

class UserMapper {
  UserMapper._();

  static UserFloor toFloor(UserModel user) {
    return UserFloor(
      id: user.id,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      avatar: user.avatar,
    );
  }

  static UserModel toModel(UserFloor user) {
    return UserModel(
      id: user.id,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      avatar: user.avatar,
    );
  }
}
