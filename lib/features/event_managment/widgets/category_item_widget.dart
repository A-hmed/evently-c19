import 'package:evently/core/models/category_model.dart';
import 'package:evently/features/app_config/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category category;
  final bool isSelected;
  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final configProvider = context.read<AppConfigProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? colorScheme.primary : colorScheme.onPrimary,
        border: Border.all(color: colorScheme.outline, width: 1),
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            category.icon,
            color: isSelected ? colorScheme.onPrimary : colorScheme.primary,
          ),
          Text(configProvider.isEn ? category.nameEn : category.nameAr),
        ],
      ),
    );
  }
}
