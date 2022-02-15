// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../screens/authentication/bloc/authentication_bloc.dart' as _i3;
import '../../screens/sign_in/bloc/sign_in_bloc.dart' as _i6;
import '../http/http_client.dart' as _i4;
import '../http/repositories/user_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i3.AuthenticationBloc>(_i3.AuthenticationBloc());
    gh.factory<_i4.HttpClient>(() => _i4.HttpClient());
    gh.factory<_i5.UserRepository>(
        () => _i5.UserRepository(httpClient: get<_i4.HttpClient>()));
    gh.factory<_i6.SignInBloc>(
        () => _i6.SignInBloc(userRepository: get<_i5.UserRepository>()));
    return this;
  }
}
