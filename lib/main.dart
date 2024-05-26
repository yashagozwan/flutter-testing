import 'package:flutter/material.dart';
import 'package:flutter_testing/app.dart';
import 'package:flutter_testing/core/di/di.dart';

void main() async {
  await configureDependencies(env: 'prod');
  runApp(const App());
}
