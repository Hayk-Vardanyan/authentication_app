import 'package:auto_route/auto_route.dart';
import 'package:untitled1/router.gr.dart';

export 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class Router extends $Router {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AdaptiveRoute(
      page: SplashScreenRoute.page,
      path: '/',
      fullscreenDialog: true,
      initial: true,
    ),
    AdaptiveRoute(page: LoginRoute.page, fullscreenDialog: true),
    AdaptiveRoute(page: DashboardRoute.page),
    AdaptiveRoute(page: StartRoute.page),
    AdaptiveRoute(page: VerificationRoute.page),
  ];
}
