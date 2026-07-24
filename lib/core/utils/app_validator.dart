import 'package:evently/core/l10n/app_localizations.dart';

abstract class AppValidator {
  static String? nameValidator(String? name, AppLocalizations locale) {
    if (name == null || name.isEmpty) {
      return locale.nameCannotBeEmpty;
    }
    if (name.length < 3) {
      return locale.nameMinLength;
    }
    return null;
  }

  static String? emailValidator(String? email, AppLocalizations locale) {
    if (email == null || email.isEmpty) {
      return locale.emailCannotBeEmpty;
    }
    if (email.length < 3) {
      return locale.emailMinLength;
    }
    if (!RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(email)) {
      return locale.invalidEmail;
    }
    return null;
  }

  static String? passwordValidator(String? password, AppLocalizations locale) {
    if (password == null || password.isEmpty) {
      return locale.passwordCannotBeEmpty;
    }
    if (password.length < 6) {
      return locale.passwordMinLength;
    }
    return null;
  }

  static String? confirmPasswordValidator({
    String? confirmPassword,
    String? password,
    required AppLocalizations locale,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return locale.confirmPasswordCannotBeEmpty;
    }
    if (confirmPassword != password) {
      return locale.passwordsDoNotMatch;
    }
    return null;
  }
}
