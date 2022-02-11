import 'package:flutter_guidelines/router/index.dart';
import 'package:flutter_guidelines/screens/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_guidelines/services/http/http_client.dart';
import 'package:flutter_guidelines/services/http/repositories/index.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future setupLocator() async {
  getIt.registerFactory(() => HttpClient());

  getIt.registerFactory(
      () => UserRepository(httpClient: getIt.get<HttpClient>()));

  getIt.registerSingleton(AuthenticationBloc());

  getIt.registerSingleton<AppRouter>(
    AppRouter(),
  );
}
