import 'package:flutter/material.dart';

import '../models/onboarding_model.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPageModel page;

  const OnboardingPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Container(
            // width: 180,
            // height: 180,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              color: colorScheme.primary.withValues(alpha: .1),
            ),
            // child: Icon(page.i, size: 84, color: colorScheme.primary),
            child: page.image,
          ),
          const SizedBox(height: 40),
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium?.copyWith(fontWeight: .w600),
          ),
          const SizedBox(height: 12),
          Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
