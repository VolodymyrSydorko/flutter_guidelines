import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guidelines/generated/index.dart';
import 'package:flutter_guidelines/screens/sign_in/models/index.dart';
import 'package:formz/formz.dart';

import '../bloc/sign_in_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    required this.emailFocusNode,
    required this.passwordFocusNode,
    Key? key,
  }) : super(key: key);

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email.value,
          focusNode: emailFocusNode,
          enabled: state.status != FormzStatus.submissionInProgress,
          decoration: InputDecoration(
            labelText: LocaleKeys.loginEmail.tr(),
            border: const OutlineInputBorder(),
            fillColor: Colors.blue,
            errorText: state.email.invalid
                ? state.email.error == EmailValidationError.invalid
                    ? 'Please enter a valid email'
                    : state.email.error == EmailValidationError.empty
                        ? 'Email is required'
                        : null
                : null,
          ),
          onChanged: (value) {
            context.read<SignInBloc>().add(SignInEvent.emailChanged(value));
          },
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(passwordFocusNode);
          },
        );
      },
    );
  }
}
