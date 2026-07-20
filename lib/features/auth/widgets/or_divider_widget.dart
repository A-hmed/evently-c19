import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(endIndent: 16, indent: 16)),
        Text(
          "OR",
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
