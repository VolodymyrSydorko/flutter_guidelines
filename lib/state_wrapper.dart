import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guidelines/screens/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_guidelines/services/index.dart';

class StateWrapper extends StatelessWidget {
  const StateWrapper({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = getIt.get<AuthenticationBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: authenticationBloc
            ..add(const AuthenticationEvent.appStarted()),
        ),
      ],
      child: child,
    );
  }
}
