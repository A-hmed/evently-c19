import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/auth/providers/sign_up_provider.dart';
import 'package:evently/features/auth/widgets/or_divider_widget.dart';
import 'package:evently/features/auth/widgets/sign_up_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.logo,
                  width: MediaQuery.sizeOf(context).width * .6,
                ),
              ),
              const SizedBox(height: 48),
              Text(
                locale.createYourAccount,
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
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
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(locale.signUp),
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(locale.alreadyHaveAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.loginScreen,
                      );
                    },
                    child: Text(locale.login),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const OrDividerWidget(),
              const SizedBox(height: 24),
              OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.google, fit: BoxFit.scaleDown),
                    const SizedBox(width: 16),
                    Text(locale.loginWithGoogle),
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
