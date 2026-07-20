import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/auth/providers/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CustomTextFormField(
          controller: context.read<SignUpProvider>().nameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          lableText: 'Name',
          hintText: "Enter your name",
          prefixIcon: Icon(IconsaxPlusLinear.user),
        ),
        CustomTextFormField(
          controller: context.read<SignUpProvider>().emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          lableText: 'Email',
          hintText: "Enter your email",
          prefixIcon: Icon(IconsaxPlusLinear.sms),
        ),
        CustomTextFormField(
          controller: context.read<SignUpProvider>().passwordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          lableText: 'Password',
          hintText: "Enter your password",
          isPassword: true,
          prefixIcon: Icon(IconsaxPlusLinear.lock),
        ),
        CustomTextFormField(
          controller: context.read<SignUpProvider>().confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          lableText: 'Confirm Password',
          hintText: "Confirm your password",
          isPassword: true,
          prefixIcon: Icon(IconsaxPlusLinear.lock),
        ),
      ],
    );
  }
}
