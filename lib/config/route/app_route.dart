
import 'package:flutter/material.dart';
import 'package:food/features/auth/pages/register_screen.dart';
import 'package:food/features/auth/pages/welcom_screen.dart';
import 'package:food/features/home/peresintation/pages/home_screen.dart';

import '../../features/auth/pages/login_screen.dart';
import '../../features/auth/pages/reset_password.dart';
import '../../features/splash/splash_screen.dart';

class AppRouteStrings {
  static const String initial = "/";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String register = "/register";
  static const String home = "/home";
  static const String resetPassword = "/resetPassword";


}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouteStrings.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRouteStrings.welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
        case AppRouteStrings.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case AppRouteStrings.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case AppRouteStrings.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case AppRouteStrings.resetPassword:
        return MaterialPageRoute(
          builder: (context) => const ResetPassword(),
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
