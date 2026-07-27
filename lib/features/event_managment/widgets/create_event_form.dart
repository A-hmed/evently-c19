import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/event_managment/providers/event_managment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEventForm extends StatelessWidget {
  const CreateEventForm({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locale.title,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: context.read<EventManagmentProvider>().titleController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          hintText: locale.eventTitle,
        ),
        const SizedBox(height: 16),
        Text(
          locale.description,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: context
              .read<EventManagmentProvider>()
              .descriptionController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          hintText: locale.eventDescription,
          maxLines: 5,
        ),
      ],
    );
  }
}
