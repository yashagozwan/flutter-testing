import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_testing/data/source/local/floor/user/user_floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'user/user_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [UserFloor])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
