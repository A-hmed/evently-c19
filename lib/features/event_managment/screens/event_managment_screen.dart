import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/widgets/custom_back_button.dart';
import 'package:evently/features/event_managment/providers/event_managment_provider.dart';
import 'package:evently/features/event_managment/widgets/category_item_widget.dart';
import 'package:evently/features/event_managment/widgets/create_event_form.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventManagmentScreen extends StatelessWidget {
  const EventManagmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final provider = context.read<EventManagmentProvider>();
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: const CustomBackButton(),
        title: Text(locale.addEvent),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            Consumer<EventManagmentProvider>(
              builder: (context, provider, child) => Column(
                spacing: 16,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.outline, width: 1),
                      image: DecorationImage(
                        image: AssetImage(provider.selectedCategory.imageLight),
                        fit: .cover,
                      ),
                    ),
                  ),
                  DefaultTabController(
                    length: Category.categories.length,
                    child: TabBar(
                      isScrollable: true,
                      tabs: Category.categories
                          .map(
                            (category) => CategoryItemWidget(
                              category: category,
                              isSelected: category == provider.selectedCategory,
                            ),
                          )
                          .toList(),

                      onTap: (index) {
                        provider.changeCategory(Category.categories[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const CreateEventForm(),
            const SizedBox(height: 16),

            Row(
              children: [
                Icon(
                  IconsaxPlusLinear.calendar_add,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  locale.eventDate,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Selector<EventManagmentProvider, DateTime?>(
                  selector: (context, provider) => provider.selectedDate,
                  builder: (context, dateTime, child) {
                    return TextButton(
                      onPressed: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          initialDate: provider.selectedDate ?? DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 100),
                          ),
                        );

                        if (date != null) provider.changeDate(date);

                        print(date);
                      },
                      child: Text(
                        dateTime == null
                            ? locale.chooseDate
                            : DateFormat('MMM dd, yyy').format(dateTime),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                Icon(IconsaxPlusLinear.clock_1, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  locale.eventTime,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Selector<EventManagmentProvider, TimeOfDay?>(
                  selector: (context, provider) => provider.timeOfDay,
                  builder: (context, timeOfDay, child) {
                    return TextButton(
                      onPressed: () async {
                        var time = await showTimePicker(
                          context: context,
                          initialTime: provider.timeOfDay ?? TimeOfDay.now(),
                        );
                        if (time != null) provider.changeTime(time);
                      },
                      child: Text(
                        timeOfDay == null
                            ? locale.chooseTime
                            : timeOfDay.format(context),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Selector<EventManagmentProvider, CreateEventStates>(
              selector: (context, provider) => provider.state,
              builder: (context, state, child) {
                final isLoading = state == CreateEventStates.loading;
                return FilledButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          provider.createEvent(context);
                        },
                  child: isLoading
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(locale.addEvent),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
