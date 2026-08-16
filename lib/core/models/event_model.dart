import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String? id;
  String? title;
  String? description;
  int? categoryId;
  String? userId;
  DateTime? dateTime;

  Event({
    this.id,
    this.title,
    this.description,
    this.categoryId,
    this.userId,
    this.dateTime,
  });

  factory Event.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Event(
      id: data?['id'],
      userId: data?['userId'],
      title: data?['title'],
      description: data?['description'],
      categoryId: data?['categoryId'],
      dateTime: (data?['dateTime'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (userId != null) "userId": userId,
      if (title != null) "title": title,
      if (description != null) "description": description,
      if (categoryId != null) "categoryId": categoryId,
      if (dateTime != null) "dateTime": dateTime,
    };
  }
}
