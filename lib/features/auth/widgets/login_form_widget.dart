import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CustomTextFormField(
          controller: TextEditingController(),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          lableText: 'Email',
          hintText: "Enter your email",
          prefixIcon: Icon(IconsaxPlusLinear.sms),
        ),
        CustomTextFormField(
          controller: TextEditingController(),
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          lableText: 'Password',
          hintText: "Enter your password",
          isPassword: true,
          prefixIcon: Icon(IconsaxPlusLinear.lock),
        ),
      ],
    );
  }
}
