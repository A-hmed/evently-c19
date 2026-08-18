import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../core/models/category_model.dart';
import '../../../../../core/models/event_model.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../event_managment/providers/event_managment_provider.dart';
import 'edit_event_screen.dart';

class EventItemDetails extends StatelessWidget {
  final Event event;

  const EventItemDetails({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    String shortMonth = DateFormat.MMM().format(event.dateTime);

    Category category = Category.getCategoryById(event.categoryId);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: const CustomBackButton(),
        title: Text('Event details'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChangeNotifierProvider(
                    create: (context) => EventManagmentProvider(),
                    child: EditEventScreen(event: event));
              }));
            },
            icon: Icon(
              IconsaxPlusLinear.edit_2,
              color: colorScheme.primary,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconsaxPlusLinear.trash,
              color: colorScheme.error,
              size: 24,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    image: AssetImage(category.imageLight),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(event.title,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(),
                child: Row(children: [
                  Icon(
                    IconsaxPlusLinear.calendar_add,
                    color: colorScheme.primary,
                    size: 24,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${event.dateTime.day} $shortMonth',
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.secondary,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(
                        '${event.dateTime.hour}:${event.dateTime.minute}',
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ]),
              ),
              const SizedBox(height: 16),
              Text('Description',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(event.description,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.secondary,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
