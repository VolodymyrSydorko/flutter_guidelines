import 'package:flutter/material.dart';
import 'package:flutter_guidelines/gen/index.dart';
import 'package:flutter_guidelines/router/index.dart';

import 'widgets/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1500,
      splash: Assets.images.logoShort.image(),
      nextRoute: const AuthenticationRouter(),
      splashTransition: SplashTransition.decoratedBoxTransition,
      backgroundColor: ColorName.white,
    );
  }
}
