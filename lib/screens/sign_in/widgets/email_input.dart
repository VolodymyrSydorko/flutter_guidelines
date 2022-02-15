import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guidelines/generated/index.dart';
import 'package:flutter_guidelines/screens/sign_in/models/index.dart';
import 'package:formz/formz.dart';

import '../bloc/sign_in_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    required this.text,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    Key? key,
  }) : super(key: key);

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 5,
                  bottom: 5,
                ),
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  style: const TextStyle(fontSize: 16, height: 1.0),
                  textInputAction: TextInputAction.next,
                  cursorHeight: 16.0,
                  initialValue: state.email.value,
                  focusNode: emailFocusNode,
                  enabled: state.status != FormzStatus.submissionInProgress,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    labelText: text,
                    border: const OutlineInputBorder(),
                    fillColor: Colors.blue,
                    errorText: state.email.invalid
                        ? state.email.error == EmailValidationError.invalid
                            ? 'Please enter a valid email'
                            : state.email.error == EmailValidationError.empty
                                ? 'Email is required'
                                : null
                        : null,
                    labelStyle: const TextStyle(fontSize: 12),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  onChanged: (value) {
                    context
                        .read<SignInBloc>()
                        .add(SignInEvent.emailChanged(value));
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
