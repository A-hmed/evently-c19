import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/utils/app_constans.dart';

class FirebaseFirestoreServices {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  static CollectionReference<Event> getEventCollectionRef() {
    return db
        .collection(AppConstans.eventCollection)
        .withConverter(
          fromFirestore: Event.fromFirestore,
          toFirestore: (Event event, _) => event.toFirestore(),
        );
  }

  static Future<void> createEvent(Event event) async {
    try {
      final ref = getEventCollectionRef();
      final document = ref.doc();
      event.id = document.id;
      await document.set(event);
    } catch (e) {
      throw e.toString();
    }
  }
}
