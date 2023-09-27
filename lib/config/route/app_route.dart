
import 'package:flutter/material.dart';
import 'package:food/features/auth/pages/register_screen.dart';
import 'package:food/features/auth/pages/welcom_screen.dart';
import 'package:food/features/home/peresintation/pages/home_screen.dart';
import 'package:food/features/order/peresintation/pages/order_screen.dart';
import 'package:food/features/profile/peresintation/pages/profile_screen.dart';

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
  static const String order = "/order";
  static const String profile = "/profile";


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

      case AppRouteStrings.order:
        return MaterialPageRoute(
          builder: (context) => const OrderScreen(),
        );

      case AppRouteStrings.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
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
