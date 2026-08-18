import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/app_config/provider/app_config_provider.dart';
import 'package:evently/features/app_config/widgets/custom_config_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AppConfigScreen extends StatelessWidget {
  const AppConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final provider = context.read<AppConfigProvider>();
    // final provider = context.watch<AppConfigProvider>();
    // final provider = Provider.of(context, listen: true);

    // AppConfigProvider provider2 = AppConfigProvider();
    // provider.changeTheme(newTheme);
    // provider2.changeTheme(newTheme);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SvgPicture.asset(
                AppImages.appConfig,
                colorFilter: ColorFilter.mode(
                  colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(
              l10n.personalizeYourExperience,
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(l10n.appConfigSubtitle, style: textTheme.bodyLarge),
            const SizedBox(height: 16),
            CustomConfigRow(
              title: l10n.language,
              isSelected: provider.isEn,
              leftChild: Text(
                l10n.english,
                style: provider.isEn
                    ? textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onPrimary,
                      )
                    : textTheme.labelMedium?.copyWith(
                        color: colorScheme.tertiary,
                      ),
              ),
              onLeftTap: () {
                provider.changeLanguage('en');
              },
              rightChild: Text(
                l10n.arabic,
                style: !provider.isEn
                    ? textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onPrimary,
                      )
                    : textTheme.labelMedium?.copyWith(
                        color: colorScheme.tertiary,
                      ),
              ),
              onRightTap: () {
                provider.changeLanguage('ar');
              },
            ),
            const SizedBox(height: 8),
            CustomConfigRow(
              title: l10n.theme,
              isSelected: !provider.isDark,
              leftChild: SvgPicture.asset(AppIcons.sun),
              onLeftTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              rightChild: SvgPicture.asset(AppIcons.moon),
              onRightTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RoutesName.onboardingScreen1);
              },
              child: Text(l10n.letsStart),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

/// setstate
/// ValueNotifier -> ValueListenableBuilder()
/// Stream contoller
/// change notifier -> ListenableBuilder
