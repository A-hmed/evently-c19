import 'package:evently/core/router/app_router.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evently App',
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes(),
      initialRoute: RoutesName.splash,
    );
  }
}
