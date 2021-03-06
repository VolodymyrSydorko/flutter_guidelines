import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import '../bloc/sign_in_bloc.dart';
import '../models/index.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    required this.text,
    required this.passwordFocusNode,
    Key? key,
  }) : super(key: key);

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
              
                TextFormField(
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.0,
                  ),
                  initialValue: state.password.value,
                  obscureText: true,
                  focusNode: passwordFocusNode,
                  cursorHeight: 16.0,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    labelText: text,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: const TextStyle(fontSize: 12),
                    suffixIcon: const Icon(FontAwesomeIcons.eye, size: 16,color:Colors.black,),
                    border: const OutlineInputBorder(),

                    errorText: state.password.invalid
                        ? state.password.error == PasswordValidationError.small
                            ? 'Password length must be at least 8 characters'
                            : state.password.error ==
                                    PasswordValidationError.empty
                                ? 'Password is required'
                                : null
                        : null,
                  ),
                  onChanged: (value) {
                    context
                        .read<SignInBloc>()
                        .add(SignInEvent.passwordChanged(value));
                  },
                  onFieldSubmitted: (_) {
                    state.status.isValidated
                        ? context
                            .read<SignInBloc>()
                            .add(const SignInEvent.formSubmitted())
                        : null;
                  },
                ),
              
              // state.password.invalid
              //     ? state.password.error == PasswordValidationError.small
              //         ? Container(
              //             alignment: Alignment.topLeft,
              //             padding: const EdgeInsets.only(top: 5),
              //             child: const Text(
              //               'Password length must be at least 8 characters',
              //               style: TextStyle(color: Colors.red),
              //             ),
              //           )
              //         : state.password.error == PasswordValidationError.empty
              //             ? Container(
              //                 alignment: Alignment.topLeft,
              //                 padding: const EdgeInsets.only(top: 5),
              //                 child: const Text(
              //                   'Password is required',
              //                   style: TextStyle(color: Colors.red),
              //                 ),
              //               )
              //             : const SizedBox()
              //     : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
