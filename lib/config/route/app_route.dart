import 'package:flutter/material.dart';
import 'package:food/core/models/product.dart';
import 'package:food/features/auth/pages/forget_password.dart';
import 'package:food/features/auth/pages/register_screen.dart';
import 'package:food/features/auth/pages/welcom_screen.dart';
import 'package:food/features/home/peresintation/pages/home_screen.dart';
import 'package:food/features/profile/peresintation/pages/profile_screen.dart';
import 'package:food/features/single_product/peresintation/pages/single_screen.dart';

import '../../features/auth/pages/login_screen.dart';
import '../../features/auth/pages/change_password.dart';
import '../../features/cart/peresintation/pages/cart_screen.dart';
import '../../features/my_orders/peresintation/pages/my_order_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRouteStrings {
  static const String initial = "/";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String confirmCode = "/confirmCode";
  static const String changePassword = "/changePassword";

  static const String register = "/register";
  static const String home = "/home";
  static const String forgetPassword = "/forgetPassword";
  static const String resetPassword = "/resetPassword";

  static const String order = "/order";
  static const String profile = "/profile";
  static const String singleProduct = "/singleProduct";
  static const String cart = "/cart";
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
      case AppRouteStrings.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
        );
      case AppRouteStrings.confirmCode:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
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
          builder: (context) => const ChangePassword(),
        );

      case AppRouteStrings.order:
        return MaterialPageRoute(
          builder: (context) => const OrderScreen(),
        );

      case AppRouteStrings.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

      case AppRouteStrings.singleProduct:
        return MaterialPageRoute(
          builder: (context) {
            Product product = routeSettings.arguments as Product;
            return SingleProduct(product: product);
          },
        );

      case AppRouteStrings.cart:
        return MaterialPageRoute(
          builder: (context) {
            return const CartScreen();
          },
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
