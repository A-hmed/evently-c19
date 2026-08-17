import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  late String id;
  late String title;
  late String description;
  late int categoryId;
  late String userId;
  late DateTime dateTime;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.userId,
    required this.dateTime,
  });

  factory Event.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    var timeStamp = data?['dateTime'] as Timestamp;
    return Event(
      id: data?['id'],
      userId: data?['userId'],
      title: data?['title'],
      description: data?['description'],
      categoryId: data?['categoryId'],
      dateTime: timeStamp.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "description": description,
      "categoryId": categoryId,
      "dateTime": dateTime,
    };
  }
}
