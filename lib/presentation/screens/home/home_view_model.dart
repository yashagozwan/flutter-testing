import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeViewModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void _callbackUpdate(void Function() cb) {
    cb();
    notifyListeners();
  }

  void increment() => _callbackUpdate(() => _count++);

  void decrement() => _callbackUpdate(() => _count--);
}
