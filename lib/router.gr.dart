// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:untitled1/pages/dashboard/dashboard_page.dart' as _i3;
import 'package:untitled1/pages/login_page/login_page.dart' as _i4;
import 'package:untitled1/pages/splash_screen/splash_screen.dart' as _i5;
import 'package:untitled1/pages/start_page/start_page.dart' as _i1;
import 'package:untitled1/pages/verification_page/verification_page.dart'
    as _i2;

abstract class $Router extends _i6.RootStackRouter {
  $Router({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StartRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartPage(),
      );
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>(
          orElse: () => const VerificationRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.VerificationPage(
          key: args.key,
          tmpToken: args.tmpToken,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreenPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.StartPage]
class StartRoute extends _i6.PageRouteInfo<void> {
  const StartRoute({List<_i6.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.VerificationPage]
class VerificationRoute extends _i6.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i7.Key? key,
    String? tmpToken,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            key: key,
            tmpToken: tmpToken,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const _i6.PageInfo<VerificationRouteArgs> page =
      _i6.PageInfo<VerificationRouteArgs>(name);
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    this.tmpToken,
  });

  final _i7.Key? key;

  final String? tmpToken;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, tmpToken: $tmpToken}';
  }
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreenPage]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
