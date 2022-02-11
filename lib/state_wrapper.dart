import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guidelines/screens/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_guidelines/services/injector/injector.dart';

class StateWrapper extends StatelessWidget {
  const StateWrapper({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<AuthenticationBloc>()
            ..add(const AuthenticationEvent.appStarted()),
        ),
      ],
      child: child,
    );
  }
}
