import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

class EventCardWidget extends StatelessWidget {
  final Event event;

  const EventCardWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final category = Category.categories.firstWhere(
          (category) => category.id == event.categoryId,
      orElse: () => Category.categories.first,
    );

    final isOwner =
        event.userId != null &&
            event.userId == FirebaseAuth.instance.currentUser?.uid;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            children: [
              Image.asset(
                isDark ? category.imageDark : category.imageLight,
                height: 140,
                width: double.infinity,
                fit: .cover,
              ),
              if (isOwner)
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: colorScheme.surface,
                    child: IconButton(
                      icon: Icon(
                        IconsaxPlusLinear.edit_2,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.eventManagmentScreen,
                          arguments: event,
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  event.title ?? '',
                  style: textTheme.titleMedium?.copyWith(fontWeight: .w600),
                ),
                const SizedBox(height: 4),
                Text(
                  event.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      IconsaxPlusLinear.calendar_1,
                      size: 16,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      event.dateTime == null
                          ? ''
                          : DateFormat(
                        'MMM dd, yyy · hh:mm a',
                      ).format(event.dateTime!),
                      style: textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      isArabic ? category.nameAr : category.nameEn,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: .w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
