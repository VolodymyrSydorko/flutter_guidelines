import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guidelines/generated/index.dart';
import 'package:flutter_guidelines/screens/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_guidelines/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_guidelines/services/injector/injector.dart';
import 'package:flutter_guidelines/widgets/index.dart';
import 'package:formz/formz.dart';

import 'widgets/index.dart';
import 'widgets/text_url_launcher.dart';

class SignInScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInBloc>(),
      child: this,
    );
  }

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _scrollContoroller = ScrollController();
  final _firstImage = Image.network(
      'https://www.mmda.mb.ca/wp-content/uploads/2019/04/DP-Logo-2-1024x379.png');
  final _secondImage = Image.network(
      'https://applotusunstablebackend.azurewebsites.net/img/cada.feabdd54.png');
  final String _url = 'https://www.dealerpilothr.com/copy-of-privacy-policy';

  void _animateToLoginButton() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _scrollContoroller.animateTo(
      100,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void initState() {
    _emailFocusNode.addListener(() async {
      if (_emailFocusNode.hasFocus) {
        _animateToLoginButton();
      }
    });
    _passwordFocusNode.addListener(() async {
      if (_passwordFocusNode.hasFocus) {
        _animateToLoginButton();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _mainContainerWidth = _screenSize.width * 0.8;

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
            showErrorSnackBar(context, 'Please enter valid email and password');
          }
        },
        child: SingleChildScrollView(
          controller: _scrollContoroller,
          child: Container(
            height: _screenSize.height,
            color: Colors.lightBlue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    height: 500,
                    width: _mainContainerWidth,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Image.network(
                            'https://applotusunstablebackend.azurewebsites.net/img/logo.bfad0c66.png',
                            scale: 2.4,
                          ),),
                        Column(
                          children: [
                            EmailInput(
                                emailFocusNode: _emailFocusNode,
                                text: LocaleKeys.loginEmail.tr(),
                                passwordFocusNode: _passwordFocusNode),
                            PasswordInput(
                              passwordFocusNode: _passwordFocusNode,
                              text: LocaleKeys.loginPassword.tr(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 20,
                                bottom: 10,
                              ),
                              height: 40,
                              child:const SignInSubmitButton(),
                              
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.topRight,
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  LocaleKeys.loginResetPasswordButtonLabel.tr(),
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: _firstImage,
                                ),
                                flex: 1),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: _secondImage),
                                flex: 1),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: _mainContainerWidth,
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextUrlLauncher(
                            text: 'Privacy Policy',
                            url: _url,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                          child: VerticalDivider(
                            thickness: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextUrlLauncher(
                            text: 'Access Policy',
                            url: _url,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                          child: VerticalDivider(
                            thickness: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextUrlLauncher(
                            text: 'Terms Of Use',
                            url: _url,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
