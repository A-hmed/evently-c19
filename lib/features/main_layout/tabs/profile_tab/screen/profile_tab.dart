import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/features/app_config/provider/app_config_provider.dart';
import 'package:evently/features/main_layout/tabs/profile_tab/widgets/language_bottom_sheet.dart';
import 'package:evently/features/main_layout/tabs/profile_tab/widgets/profile_action_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage('assets/images/route_profile.png'),
            ),
            const SizedBox(height: 16),
            Text(
              FirebaseAuth.instance.currentUser?.displayName ?? "",
              textAlign: TextAlign.center,
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              FirebaseAuth.instance.currentUser?.email ?? "",
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Consumer<AppConfigProvider>(
              builder: (context, provider, child) {
                return ProfileActionWidget(
                  title: locale.darkTheme,
                  trailing: SizedBox(
                    width: 24,
                    height: 24,
                    child: Switch(
                      value: provider.isDark,
                      onChanged: (isDark) {
                        provider.changeTheme(
                          isDark ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            ProfileActionWidget(
              title: locale.language,
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorScheme.primary,
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: colorScheme.surface,
                  builder: (context) {
                    return const LanguageBottomSheet();
                  },
                );
              },
            ),
            const SizedBox(height: 8),
            ProfileActionWidget(
              title: locale.logout,
              onTap: () {
                FirebaseServices.logout();
                Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
              },
              trailing: Icon(
                IconsaxPlusLinear.logout,
                color: colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
