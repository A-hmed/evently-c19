import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_firestore_services.dart';
import 'package:flutter/material.dart';

import 'event_card_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const SizedBox(height: 16),
            Text(
              locale.home,
              style: textTheme.titleLarge?.copyWith(fontWeight: .w700),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<List<Event>>(
                stream: FirebaseFirestoreServices.getEventsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.error,
                        ),
                      ),
                    );
                  }

                  final events = snapshot.data ?? [];

                  if (events.isEmpty) {
                    return Center(
                      child: Text(
                        "No Events Yet!",
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.secondary,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return EventCardWidget(event: events[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
