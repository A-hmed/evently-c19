import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/event_managment/providers/event_managment_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({super.key});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  bool _initialized = false;
  late String eventId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final event = ModalRoute.of(context)!.settings.arguments as Event;
      eventId = event.id;
      final provider = Provider.of<EventManagmentProvider>(context, listen: false);
      
      provider.titleController.text = event.title;
      provider.descriptionController.text = event.description;
      provider.selectedDate = event.dateTime;
      provider.timeOfDay = TimeOfDay.fromDateTime(event.dateTime);
      provider.selectedCategory = Category.getCategoryById(event.categoryId);
      
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final provider = Provider.of<EventManagmentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Edit event'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                isDark ? provider.selectedCategory.imageDark : provider.selectedCategory.imageLight,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = Category.categories[index];
                  final isSelected = category.id == provider.selectedCategory.id;
                  return GestureDetector(
                    onTap: () {
                      provider.changeCategory(category);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? theme.colorScheme.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: theme.colorScheme.primary),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            category.icon,
                            color: isSelected
                                ? Colors.white
                                : theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            category.nameEn,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: isSelected
                                  ? Colors.white
                                  : theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: Category.categories.length,
              ),
            ),
            const SizedBox(height: 16),
            Text('Title', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: provider.titleController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              hintText: 'Event Title',
              prefixIcon: const Icon(Icons.edit_note),
            ),
            const SizedBox(height: 16),
            Text('Description', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: provider.descriptionController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              hintText: 'Event Description',
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_month),
              title: const Text('Event Date'),
              trailing: TextButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: provider.selectedDate ?? DateTime.now(),
                    firstDate: DateTime.now().subtract(const Duration(days: 365)),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    provider.changeDate(date);
                  }
                },
                child: Text(
                  provider.selectedDate == null
                      ? 'Select Date'
                      : DateFormat('dd MMM yyyy').format(provider.selectedDate!),
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.access_time),
              title: const Text('Event Time'),
              trailing: TextButton(
                onPressed: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: provider.timeOfDay ?? TimeOfDay.now(),
                  );
                  if (time != null) {
                    provider.changeTime(time);
                  }
                },
                child: Text(
                  provider.timeOfDay == null
                      ? 'Select Time'
                      : provider.timeOfDay!.format(context),
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                provider.updateEvent(context, eventId);
              },
              child: provider.state == CreateEventStates.loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Update event'),
            ),
          ],
        ),
      ),
    );
  }
}
