import 'package:flutter/material.dart';

class ProfileActionWidget extends StatelessWidget {
  final String title;
  final Widget trailing;
  final void Function()? onTap;
  const ProfileActionWidget({
    super.key,
    required this.title,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.onPrimary,
          border: Border.all(color: colorScheme.outline, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.secondary,
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
