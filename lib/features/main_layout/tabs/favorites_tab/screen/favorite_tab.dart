import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_firestore_services.dart';
import 'package:evently/features/main_layout/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Event>>(
        stream: FirebaseFirestoreServices.getFavoriteEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          } else if (snapshot.hasData) {
            return Column(
              children: [
                buildEventsList(snapshot.requireData, context),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildEventsList(List<Event> events, BuildContext context) {
    return events.isEmpty
        ? Expanded(
            child: Center(
              child: Text(
                "No favorite events yet",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        : Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventWidget(events[index]);
              },
            ),
          );
  }
}
