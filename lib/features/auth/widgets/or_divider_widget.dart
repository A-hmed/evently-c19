import 'package:evently/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Row(
      children: [
        const Expanded(child: Divider(endIndent: 16, indent: 16)),
        Text(
          locale.or,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: .w500,
          ),
        ),
        const Expanded(child: Divider(endIndent: 16, indent: 16)),
      ],
    );
  }
}
