part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.appStarted() = AppStarted;
  const factory AuthenticationEvent.loggedIn(UserProfile userProfile) =
      LoggedIn;
  const factory AuthenticationEvent.logout() = Logout;
}
