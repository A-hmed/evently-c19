import 'package:evently/core/router/app_router.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/services/shared_pref_service.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/app_config/provider/app_config_provider.dart';
import 'package:evently/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:evently/core/l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en'), Locale('ar')],
            locale: Locale(provider.locale),
            routes: AppRouter.routes(),
            initialRoute: RoutesName.appConfigScreen,
          );
        },
      ),
    );
  }
}
