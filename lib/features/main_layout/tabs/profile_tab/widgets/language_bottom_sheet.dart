import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/features/app_config/provider/app_config_provider.dart';
import 'package:evently/features/main_layout/tabs/profile_tab/widgets/profile_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: .start,
          children: [
            Text(locale.language, style: textTheme.titleLarge),
            ProfileActionWidget(
              title: locale.arabic,
              onTap: () {
                context.read<AppConfigProvider>().changeLanguage('ar');
                Navigator.pop(context);
              },
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorScheme.primary,
              ),
            ),
            ProfileActionWidget(
              title: locale.english,
              onTap: () {
                context.read<AppConfigProvider>().changeLanguage('en');
                Navigator.pop(context);
              },
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
