import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/utils/app_validator.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/auth/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.read<LoginProvider>();
    final locale = AppLocalizations.of(context)!;
    return Form(
      key: loginProvider.formKey,
      child: Column(
        spacing: 8,
        children: [
          CustomTextFormField(
            controller: loginProvider.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            lableText: locale.email,
            hintText: locale.enterYourEmail,
            prefixIcon: const Icon(IconsaxPlusLinear.sms),
            validator: (value) => AppValidator.emailValidator(value, locale),
          ),
          CustomTextFormField(
            controller: loginProvider.passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            lableText: locale.password,
            hintText: locale.enterYourPassword,
            isPassword: true,
            prefixIcon: const Icon(IconsaxPlusLinear.lock),
            validator: (value) => AppValidator.passwordValidator(value, locale),
          ),
        ],
      ),
    );
  }
}
