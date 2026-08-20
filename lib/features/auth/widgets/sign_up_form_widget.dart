import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/utils/app_validator.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/auth/providers/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Form(
      key: context.read<SignUpProvider>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<SignUpProvider>().nameController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            lableText: locale.name,
            hintText: locale.enterYourName,
            prefixIcon: const Icon(IconsaxPlusLinear.user),
            validator: (value) => AppValidator.nameValidator(value, locale),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: context.read<SignUpProvider>().nameController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            lableText: locale.name,
            hintText: locale.enterYourName,
            prefixIcon: const Icon(IconsaxPlusLinear.user),
            validator: (value) => AppValidator.nameValidator(value, locale),
          ),
          CustomTextFormField(
            controller: context.read<SignUpProvider>().emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            lableText: locale.email,
            hintText: locale.enterYourEmail,
            prefixIcon: const Icon(IconsaxPlusLinear.sms),
            validator: (value) => AppValidator.emailValidator(value, locale),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: context.read<SignUpProvider>().passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            lableText: locale.password,
            hintText: locale.enterYourPassword,
            isPassword: true,
            prefixIcon: const Icon(IconsaxPlusLinear.lock),
            validator: (value) => AppValidator.passwordValidator(value, locale),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: context
                .read<SignUpProvider>()
                .confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            lableText: locale.confirmPassword,
            hintText: locale.confirmYourPassword,
            isPassword: true,
            prefixIcon: const Icon(IconsaxPlusLinear.lock),
            validator: (confirmPassword) {
              return AppValidator.confirmPasswordValidator(
                confirmPassword: confirmPassword,
                password: context
                    .read<SignUpProvider>()
                    .passwordController
                    .text,
                locale: locale,
              );
            },
          ),
        ],
      ),
    );
  }
}
