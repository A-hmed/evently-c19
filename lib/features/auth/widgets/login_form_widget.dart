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
    return Form(
      key: loginProvider.formKey,
      child: Column(
        spacing: 8,
        children: [
          CustomTextFormField(
            controller: loginProvider.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            lableText: 'Email',
            hintText: "Enter your email",
            prefixIcon: Icon(IconsaxPlusLinear.sms),
            validator: AppValidator.emailValidator,
          ),
          CustomTextFormField(
            controller: loginProvider.passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            lableText: 'Password',
            hintText: "Enter your password",
            isPassword: true,
            prefixIcon: Icon(IconsaxPlusLinear.lock),
            validator: AppValidator.passwordValidator,
          ),
        ],
      ),
    );
  }
}
