import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart' hide Router;

import 'pages/splash_screen/splash_screen.dart';
import 'providers/screen_service.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
// import 'themes/dark_theme.dart';
// import 'themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextHeightBehavior(
      textHeightBehavior: const TextHeightBehavior(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      child: MaterialApp.router(
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        // debugShowCheckedModeBanner: GetIt.I<FlavorService>().isDevelopment,
        theme: lightTheme,
        darkTheme: darkTheme,
        routerDelegate: router.delegate(
          navigatorObservers: () => [
            // analyticsService.observer,
          ],
        ),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1,
          ),
          child: child ?? const Scaffold(),
        ),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
