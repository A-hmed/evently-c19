import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/auth/providers/login_provider.dart';
import 'package:evently/features/auth/widgets/login_form_widget.dart';
import 'package:evently/features/auth/widgets/or_divider_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
    bool _isLoading = false;
    Future<void> _handleGoogleSignIn() async {
      setState(() => _isLoading = true);

      try {
        final GoogleSignInAccount googleUser =
        await GoogleSignIn.instance.authenticate();

        final GoogleSignInAuthentication googleAuth =
            googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
        );

        final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

        if (!mounted) return;

        // success — navigate to home
        Navigator.pushReplacementNamed(context, RoutesName.mainLayoutScreen);
      } on GoogleSignInException catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign-in failed: ${e.description}')),
        );
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
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
                style: textTheme.titleLarge?.copyWith(fontWeight: .w600),
              ),
              const SizedBox(height: 24),
              const LoginFormWidget(),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    locale.forgotPassword,
                    style: const TextStyle(fontWeight: .w600),
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
              OutlinedButton(
                onPressed:  _isLoading ? null : _handleGoogleSignIn,
                child: Row(
                  mainAxisAlignment: .center,
                  spacing: 16,
                  children: [
                    SvgPicture.asset(AppIcons.google, fit: .scaleDown),
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
