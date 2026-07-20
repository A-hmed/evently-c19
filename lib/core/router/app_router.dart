import 'package:evently/core/router/routes_name.dart';
import 'package:evently/features/app_config/screens/app_config_screen.dart';
import 'package:evently/features/auth/screens/login_screen.dart';
import 'package:evently/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      RoutesName.splash: (_) => const SplashScreen(),
      RoutesName.appConfigScreen: (_) => const AppConfigScreen(),
      RoutesName.loginScreen: (_) => const LoginScreen(),
    };
  }
}
