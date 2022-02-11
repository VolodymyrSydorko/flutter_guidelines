part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(Email.pure('')) Email email,
    @Default(Password.pure('')) Password password,
    @Default(FormzStatus.pure) FormzStatus status,
    UserProfile? userProfile,
    String? errorMessage,
  }) = _SignInState;
}
