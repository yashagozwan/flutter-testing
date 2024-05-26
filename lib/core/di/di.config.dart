// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_testing/data/repository/user_repository_impl.dart'
    as _i6;
import 'package:flutter_testing/data/repository/user_repostiory_dev.dart'
    as _i5;
import 'package:flutter_testing/domain/repository/user_repository.dart' as _i4;
import 'package:flutter_testing/presentation/screens/home/home_view_model.dart'
    as _i3;
import 'package:flutter_testing/presentation/screens/user/user_view_model.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.HomeViewModel>(() => _i3.HomeViewModel());
    gh.singleton<_i4.UserRepository>(
      () => _i5.UserRepositoryDev(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i4.UserRepository>(
      () => _i6.UserRepositoryImpl(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i7.UserViewModel>(
        () => _i7.UserViewModel(gh<_i4.UserRepository>()));
    return this;
  }
}
