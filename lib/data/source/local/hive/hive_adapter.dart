import 'package:flutter_testing/data/source/local/hive/user/user_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveAdapter {
  HiveAdapter._();

  static void init() {
    Hive.registerAdapter(UserHiveAdapter());
  }
}
