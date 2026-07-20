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
    bool isSelected = true;

    final provider = context.read<AppConfigProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
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
              "Personalize Your Experience",
              style: textTheme.titleMedium?.copyWith(fontWeight: .w600),
            ),
            const SizedBox(height: 8),
            Text(
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            CustomConfigRow(
              title: 'Language',
              isSelected: isSelected,
              leftChild: Text(
                'English',
                style: isSelected
                    ? textTheme.labelMedium?.copyWith(
                        fontWeight: .w600,
                        color: colorScheme.onPrimary,
                      )
                    : textTheme.labelMedium?.copyWith(
                        color: colorScheme.tertiary,
                      ),
              ),
              onLeftTap: () {},
              rightChild: Text(
                "Arabic",
                style: !isSelected
                    ? textTheme.labelMedium?.copyWith(
                        fontWeight: .w600,
                        color: colorScheme.onPrimary,
                      )
                    : textTheme.labelMedium?.copyWith(
                        color: colorScheme.tertiary,
                      ),
              ),
              onRightTap: () {},
            ),
            const SizedBox(height: 8),
            CustomConfigRow(
              title: 'Theme',
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
            FilledButton(onPressed: () {}, child: Text("Let’s start")),
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