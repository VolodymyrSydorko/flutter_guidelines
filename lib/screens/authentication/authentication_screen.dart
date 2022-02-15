import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guidelines/router/index.dart';

import 'bloc/authentication_bloc.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStatus = context.watch<AuthenticationBloc>().state.authStatus;

    return AutoRouter.declarative(
      routes: (context) {
        switch (authStatus) {
          case AuthStatus.initial:
            return [const SignInRoute()];
          case AuthStatus.authenticated:
            return [const HomeRouter()];
          case AuthStatus.unauthenticated:
            return [const SignInRoute()];
        }
      },
    );
  }
}
