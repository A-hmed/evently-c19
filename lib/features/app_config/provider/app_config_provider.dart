import 'package:flutter/material.dart';

import '../../../core/services/shared_pref_service.dart';
import '../../../core/utils/app_constans.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) {
    themeMode = newTheme;
    SharedPrefService.setString(AppConstans.themeModeKey, newTheme.name);
    notifyListeners();
  }

  bool get isDark => themeMode == ThemeMode.dark;

  String locale = SharedPrefService.getString(AppConstans.localeKey) ?? 'en';

  void changeLanguage(String newLocale) {
    locale = newLocale;
    SharedPrefService.setString(AppConstans.localeKey, newLocale);
    notifyListeners();
  }

  bool get isEn => locale == 'en';
}
