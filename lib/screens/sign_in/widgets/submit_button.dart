import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guidelines/gen/colors.gen.dart';
import 'package:flutter_guidelines/generated/index.dart';
import 'package:formz/formz.dart';

import '../bloc/sign_in_bloc.dart';

class SignInSubmitButton extends StatelessWidget {
  const SignInSubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Center(
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              return const CircularProgressIndicator(color: ColorName.white);
            } else {
              return Text(LocaleKeys.login_buttonText.tr());
            }
          },
        ),
      ),
      onPressed: () {
        context.read<SignInBloc>().add(const SignInEvent.formSubmitted());
      },
    );
  }
}
