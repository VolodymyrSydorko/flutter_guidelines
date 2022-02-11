// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:flutter_guidelines/screens/index.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    AuthenticationRouter.name: (routeData) {
      return _i2.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.AuthenticationScreen(),
          transitionsBuilder: _i2.TransitionsBuilders.zoomIn,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    SignInRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SignInScreen());
    },
    HomeRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    DashboardRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.DashboardScreen());
    },
    TasksRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.TasksScreen());
    },
    ConfigRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ConfigScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ProfileScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(SplashRoute.name, path: '/'),
        _i2.RouteConfig(AuthenticationRouter.name, path: '/auth', children: [
          _i2.RouteConfig(SignInRoute.name,
              path: 'sign-in', parent: AuthenticationRouter.name),
          _i2.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: AuthenticationRouter.name,
              children: [
                _i2.RouteConfig(HomeRoute.name,
                    path: '',
                    parent: HomeRouter.name,
                    children: [
                      _i2.RouteConfig(DashboardRoute.name,
                          path: 'dashboard', parent: HomeRoute.name),
                      _i2.RouteConfig(TasksRoute.name,
                          path: 'tasks', parent: HomeRoute.name),
                      _i2.RouteConfig(ConfigRoute.name,
                          path: 'config', parent: HomeRoute.name),
                      _i2.RouteConfig(ProfileRoute.name,
                          path: 'profile', parent: HomeRoute.name)
                    ])
              ])
        ]),
        _i2.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i2.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i1.AuthenticationScreen]
class AuthenticationRouter extends _i2.PageRouteInfo<void> {
  const AuthenticationRouter({List<_i2.PageRouteInfo>? children})
      : super(AuthenticationRouter.name,
            path: '/auth', initialChildren: children);

  static const String name = 'AuthenticationRouter';
}

/// generated route for
/// [_i1.SignInScreen]
class SignInRoute extends _i2.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeRouter extends _i2.PageRouteInfo<void> {
  const HomeRouter({List<_i2.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i2.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: 'dashboard');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i1.TasksScreen]
class TasksRoute extends _i2.PageRouteInfo<void> {
  const TasksRoute() : super(TasksRoute.name, path: 'tasks');

  static const String name = 'TasksRoute';
}

/// generated route for
/// [_i1.ConfigScreen]
class ConfigRoute extends _i2.PageRouteInfo<void> {
  const ConfigRoute() : super(ConfigRoute.name, path: 'config');

  static const String name = 'ConfigRoute';
}

/// generated route for
/// [_i1.ProfileScreen]
class ProfileRoute extends _i2.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
