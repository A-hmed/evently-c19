import 'dart:async';

import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/router/app_router.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/services/shared_pref_service.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/app_config/provider/app_config_provider.dart';
import 'package:evently/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
    serverClientId:
        '541581553358-1srr2ffr0nlub9p98rstdpt638g38qlj.apps.googleusercontent.com',
  );
  await SharedPrefService.init();
  runApp(EventlyApp());
}

class EventlyApp extends StatelessWidget {
  EventlyApp({super.key});
  var themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: ChangeNotifierProvider(
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
              initialRoute: RoutesName.splash,
            );
          },
        ),
      ),
    );
  }
}
