import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies({required String env}) async =>
    getIt.init(environment: env);
