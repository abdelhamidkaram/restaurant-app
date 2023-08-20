
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/pages/login_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRouteStrings {
  static const String initial = "/";
  static const String login = "/login";

}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouteStrings.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRouteStrings.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(' UNDEFINED ROUTE '),
        ),
      ),
    );
  }
}
