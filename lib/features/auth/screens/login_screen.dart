import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/auth/providers/login_provider.dart';
import 'package:evently/features/auth/widgets/login_form_widget.dart';
import 'package:evently/features/auth/widgets/or_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;
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
                locale.loginToYourAccount,
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24),
              const LoginFormWidget(),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    locale.forgotPassword,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Consumer<LoginProvider>(
                builder: (context, provider, child) {
                  return FilledButton(
                    onPressed: () {
                      if (provider.loginStates == LoginStates.loading) return;
                      provider.login(context);
                    },
                    child: provider.loginStates == LoginStates.loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(locale.login),
                  );
                },
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(locale.dontHaveAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.signUpScreen,
                      );
                    },
                    child: Text(locale.signUp),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const OrDividerWidget(),
              const SizedBox(height: 24),
              Consumer<LoginProvider>(
                builder: (context, provider, child) {
                  return OutlinedButton(
                    onPressed: () {
                      if (provider.loginStates == LoginStates.loading) return;
                      provider.loginWithGoogle(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.google, fit: BoxFit.scaleDown),
                        const SizedBox(width: 16),
                        Text(locale.loginWithGoogle),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
