import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_guidelines/models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@singleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<AppStarted>(_appStarted);
    on<LoggedIn>(_loggedIn);
    on<Logout>(_logout);
  }

  FutureOr<void> _appStarted(
      AppStarted event, Emitter<AuthenticationState> emit) {
    //init all services
    //auto login

    emit(AuthenticationState.unauthenticated());
  }

  FutureOr<void> _loggedIn(
      LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationState.authenticated(event.userProfile));
  }

  FutureOr<void> _logout(Logout event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState.unauthenticated());
  }
}
