import 'package:flutter/material.dart';

class CustomConfigRow extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Widget leftChild;
  final Widget rightChild;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;

  const CustomConfigRow({
    super.key,
    required this.title,
    required this.isSelected,
    required this.leftChild,
    required this.rightChild,
    required this.onLeftTap,
    required this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Text(
          title,
          style: textTheme.titleSmall?.copyWith(
            fontWeight: .w500,
            color: colorScheme.primary,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onLeftTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? colorScheme.primary : colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: leftChild,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onRightTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? colorScheme.onPrimary : colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: rightChild,
          ),
        ),
      ],
    );
  }
}
