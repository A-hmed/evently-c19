import 'package:flutter/material.dart';

class PageIndicatorDot extends StatelessWidget {
  final bool isActive;

  const PageIndicatorDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? colorScheme.primary : colorScheme.outline,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
