import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_guidelines/models/index.dart';
import 'package:flutter_guidelines/services/http/repositories/user_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../models/index.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required this.userRepository}) : super(const SignInState()) {
    on<EmailChanged>(_emailChanged);
    on<EmailUnfocused>(_emailUnfocused);
    on<PasswordChanged>(_passwordChanged);
    on<PasswordUnfocused>(_passwordUnfocused);
    on<FormSubmitted>(_formSubmitted);
  }

  final UserRepository userRepository;

  FutureOr<void> _emailChanged(EmailChanged event, Emitter<SignInState> emit) {
    final email = Email.dirty(event.email);

    emit(
      state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  FutureOr<void> _emailUnfocused(
      EmailUnfocused event, Emitter<SignInState> emit) {
    final email = Email.dirty(state.email.value);

    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  FutureOr<void> _passwordChanged(
      PasswordChanged event, Emitter<SignInState> emit) {
    final password = Password.dirty(event.password);

    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  FutureOr<void> _passwordUnfocused(
      PasswordUnfocused event, Emitter<SignInState> emit) {
    final password = Password.dirty(state.password.value);

    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  FutureOr<void> _formSubmitted(
      FormSubmitted event, Emitter<SignInState> emit) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    emit(
      state.copyWith(
        email: email,
        password: password,
        status: Formz.validate([email, password]),
      ),
    );

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      await _signIn(emit, email.value, password.value);
    } else {
      emit(state.copyWith(status: FormzStatus.submissionCanceled));
    }
  }

  Future _signIn(
      Emitter<SignInState> emit, String email, String password) async {
    try {
      final response =
          await userRepository.signInWithEmailAndPassword(email, password);

      final userProfile = await userRepository.getUser(response.id);

      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, userProfile: userProfile));
    } catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: 'Incorrect email or password'));
    }
  }
}
