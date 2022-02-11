part of 'authentication_bloc.dart';

enum AuthStatus {
  initial,
  authenticated,
  unauthenticated,
}

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default(AuthStatus.initial) AuthStatus authStatus,
    UserProfile? userProfile,
  }) = _AuthenticationState;

  factory AuthenticationState.authenticated(UserProfile userProfile) =>
      const AuthenticationState(authStatus: AuthStatus.authenticated);

  factory AuthenticationState.unauthenticated() =>
      const AuthenticationState(authStatus: AuthStatus.unauthenticated);
}
