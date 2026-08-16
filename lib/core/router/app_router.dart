import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/features/app_config/screens/app_config_screen.dart';
import 'package:evently/features/auth/providers/login_provider.dart';
import 'package:evently/features/auth/providers/sign_up_provider.dart';
import 'package:evently/features/auth/screens/login_screen.dart';
import 'package:evently/features/auth/screens/sign_up_screen.dart';
import 'package:evently/features/event_managment/providers/event_managment_provider.dart';
import 'package:evently/features/event_managment/screens/event_managment_screen.dart';
import 'package:evently/features/main_layout/screen/main_layout_screen.dart';
import 'package:evently/features/onboarding/screens/onboarding_screen.dart' hide EventManagmentScreen;
import 'package:evently/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      RoutesName.splash: (_) => const SplashScreen(),
      RoutesName.onboardingScreen: (_) => const OnboardingScreen(),
      RoutesName.appConfigScreen: (_) => const AppConfigScreen(),
      RoutesName.loginScreen: (_) => ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        child: const LoginScreen(),
      ),
      RoutesName.signUpScreen: (_) => ChangeNotifierProvider(
        create: (context) => SignUpProvider(),
        child: const SignUpScreen(),
      ),
      RoutesName.mainLayoutScreen: (_) => const MainLayoutScreen(),
      RoutesName.eventManagmentScreen: (context) {
        final eventToEdit =
        ModalRoute.of(context)?.settings.arguments as Event?;
        return ChangeNotifierProvider(
          create: (context) =>
          EventManagmentProvider()..initForEdit(eventToEdit),
          child: const EventManagmentScreen(),
        );
      },
    };
  }
}
