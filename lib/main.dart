import 'package:evently/core/router/app_router.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/app_config/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: Consumer<AppConfigProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Evently App',
            themeMode: provider.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            routes: AppRouter.routes(),
            initialRoute: RoutesName.splash,
          );
        },
      ),
    );
  }
}
