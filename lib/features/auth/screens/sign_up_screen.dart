import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/auth/providers/sign_up_provider.dart';
import 'package:evently/features/auth/widgets/or_divider_widget.dart';
import 'package:evently/features/auth/widgets/sign_up_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: Image.asset(
                  AppImages.logo,
                  width: MediaQuery.sizeOf(context).width * .6,
                ),
              ),
              const SizedBox(height: 48),
              Text(
                "Create your account",
                style: textTheme.titleLarge?.copyWith(fontWeight: .w600),
              ),
              const SizedBox(height: 24),
              const SignUpFormWidget(),
              const SizedBox(height: 48),
              Consumer<SignUpProvider>(
                builder: (context, provider, child) {
                  return FilledButton(
                    onPressed: provider.state == SignUpState.loading
                        ? null
                        : () {
                            provider.signUp(context);
                          },
                    child: provider.state == SignUpState.loading
                        ? Center(
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text("SignUp"),
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text("Already have an account? "),
                  TextButton(onPressed: () {}, child: const Text("Login")),
                ],
              ),
              const SizedBox(height: 24),
              const OrDividerWidget(),
              const SizedBox(height: 24),
              OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: .center,
                  spacing: 16,
                  children: [
                    SvgPicture.asset(AppIcons.google, fit: .scaleDown),
                    Text("Login with Google"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
