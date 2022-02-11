import 'package:auto_route/auto_route.dart';
import 'package:flutter_guidelines/screens/index.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashScreen,
      initial: true,
    ),
    // Main authentication router
    CustomRoute(
      path: '/auth',
      name: 'AuthenticationRouter',
      page: AuthenticationScreen,
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: 300,
      children: [
        AutoRoute(
          path: 'sign-in',
          page: SignInScreen,
        ),
        AutoRoute(
          path: 'home',
          page: HomeScreen,
        )
      ],
    ),
    RedirectRoute(
      path: '*',
      redirectTo: '/',
    ),
  ],
)
class $AppRouter {}
