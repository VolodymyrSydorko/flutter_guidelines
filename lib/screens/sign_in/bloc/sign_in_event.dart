part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.emailChanged(String email) = EmailChanged;
  const factory SignInEvent.emailUnfocused() = EmailUnfocused;
  const factory SignInEvent.passwordChanged(String password) = PasswordChanged;
  const factory SignInEvent.passwordUnfocused() = PasswordUnfocused;
  const factory SignInEvent.formSubmitted() = FormSubmitted;
}
