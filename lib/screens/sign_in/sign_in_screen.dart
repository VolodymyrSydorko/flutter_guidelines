import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guidelines/gen/index.dart';
import 'package:flutter_guidelines/generated/index.dart';
import 'package:flutter_guidelines/screens/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_guidelines/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_guidelines/services/http/repositories/index.dart';
import 'package:flutter_guidelines/services/index.dart';
import 'package:flutter_guidelines/widgets/index.dart';
import 'package:formz/formz.dart';

import 'widgets/index.dart';

class SignInScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignInBloc(userRepository: getIt.get<UserRepository>()),
      child: this,
    );
  }

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.status == FormzStatus.submissionSuccess) {
            context
                .read<AuthenticationBloc>()
                .add(AuthenticationEvent.loggedIn(state.userProfile!));

            showInfoSnackBar(
                context, 'You are logged as ${state.userProfile?.email}');
          } else if (state.status == FormzStatus.submissionFailure &&
              state.errorMessage != null) {
            showErrorSnackBar(context, state.errorMessage!);
          } else if (state.status == FormzStatus.submissionCanceled) {
            showErrorSnackBar(context, 'Pleae enter valid email and password');
          }
        },
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            height: _screenSize.height,
            color: Colors.lightBlue,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                height: _screenSize.height * 0.7,
                width: _screenSize.width * 0.8,
                child: Column(
                  children: [
                    Container(
                      height: _screenSize.height * 0.09,
                      width: _screenSize.width * 0.8,
                      padding: const EdgeInsets.all(20.0),
                      child: FittedImage(image: Assets.images.logo.image()),
                    ),
                    SizedBox(
                      height: _screenSize.height * 0.15,
                    ),
                    Container(
                      height: _screenSize.height * 0.09,
                      width: _screenSize.width * 0.8,
                      padding: const EdgeInsets.all(10),
                      child: EmailInput(
                          emailFocusNode: _emailFocusNode,
                          passwordFocusNode: _passwordFocusNode),
                    ),
                    Container(
                      height: _screenSize.height * 0.09,
                      width: _screenSize.width * 0.8,
                      padding: const EdgeInsets.all(10),
                      child: PasswordInput(
                        passwordFocusNode: _passwordFocusNode,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: 5,
                      ),
                      width: _screenSize.width * 0.8,
                      height: _screenSize.height * 0.09,
                      child: const SignInSubmitButton(),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          LocaleKeys.resetPassword.tr(),
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            height: _screenSize.height * 0.1,
                            width: _screenSize.width * 0.35,
                            padding: const EdgeInsets.all(10.0),
                            child: FittedImage(
                                image: Assets.images.logoShort.image()),
                          ),
                          const Spacer(),
                          Container(
                            height: _screenSize.height * 0.1,
                            width: _screenSize.width * 0.35,
                            padding: const EdgeInsets.all(10.0),
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: Assets.images.logoShort.image()),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
