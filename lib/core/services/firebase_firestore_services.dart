import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/models/user_model.dart';
import 'package:evently/core/utils/app_constans.dart';

class FirebaseFirestoreServices {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  static CollectionReference<Event> getEventCollectionRef() {
    var eventsCollection = db
        .collection(AppConstans.eventCollection)
        .withConverter(
          fromFirestore: Event.fromFirestore,
          toFirestore: (Event event, _) => event.toFirestore(),
        );
    return eventsCollection;
  }

  static Future<void> createEvent(Event event) async {
    try {
      final ref = getEventCollectionRef();
      final document = ref.doc();

      ///Create a new document with auto generated id
      event.id = document.id;
      await document.set(event);
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> updateEvent(Event event) async {
    try {
      final ref = getEventCollectionRef();
      await ref.doc(event.id).update(event.toFirestore());
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> deleteEvent(String eventId) async {
    try {
      final ref = getEventCollectionRef();
      await ref.doc(eventId).delete();
    } catch (e) {
      throw e.toString();
    }
  }

  static Stream<List<Event>> getEventsList() {
    var streamQuerySnapShot = getEventCollectionRef().snapshots();
    return streamQuerySnapShot.map((querySnapShot) {
      var events = querySnapShot.docs.map((doc) {
        return doc.data();
      }).toList();
      events.sort((event1, event2) {
        return event2.dateTime.compareTo(event1.dateTime);
      });

      return events;
    });
  }

  static Future<void> addEventToFavorite(String eventId) async {
    var favorites = UserModel.currentUser.favorites;
    favorites.add(eventId);
    db
        .collection(UserModel.collectionName)
        .doc(UserModel.currentUser.id)
        .update({"favorites": favorites});
  }

  static Future<void> removeEventFromFavorite(String eventId) async {
    var favorites = UserModel.currentUser.favorites;
    favorites.remove(eventId);
    db
        .collection(UserModel.collectionName)
        .doc(UserModel.currentUser.id)
        .update({"favorites": favorites});
  }

  static Stream<List<Event>>? getFavoriteEvents() {
    var streamQuerySnapShot = getEventCollectionRef()
        .where("id", whereIn: UserModel.currentUser.favorites)
        .snapshots();
    return streamQuerySnapShot.map((querySnapShot) {
      var events = querySnapShot.docs.map((doc) {
        return doc.data();
      }).toList();
      events.sort((event1, event2) {
        return event1.dateTime.compareTo(event2.dateTime);
      });
      return events;
      // return evnets
      //     .where((event) => UserModel.currentUser.isFavorite(event.id))
      //     .toList();
    });
  }
}
