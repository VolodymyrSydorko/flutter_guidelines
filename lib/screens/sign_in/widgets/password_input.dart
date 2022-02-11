import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guidelines/generated/index.dart';
import 'package:formz/formz.dart';

import '../bloc/sign_in_bloc.dart';
import '../models/index.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    required this.passwordFocusNode,
    Key? key,
  }) : super(key: key);

  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password.value,
          obscureText: true,
          focusNode: passwordFocusNode,
          decoration: InputDecoration(
            labelText: LocaleKeys.loginPassword.tr(),
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
            border: const OutlineInputBorder(),
            fillColor: Colors.blue,
            errorText: state.email.invalid
                ? state.password.error == PasswordValidationError.small
                    ? 'Password length must be at least 8 characters'
                    : state.password.error == PasswordValidationError.empty
                        ? 'Password is required'
                        : null
                : null,
          ),
          onChanged: (value) {
            context.read<SignInBloc>().add(SignInEvent.passwordChanged(value));
          },
          onFieldSubmitted: (_) {
            state.status.isValidated
                ? context
                    .read<SignInBloc>()
                    .add(const SignInEvent.formSubmitted())
                : null;
          },
        );
      },
    );
  }
}
