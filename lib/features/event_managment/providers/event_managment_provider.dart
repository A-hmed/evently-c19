import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum CreateEventStates { initial, loading, success, failure }

class EventManagmentProvider extends ChangeNotifier {
  Category selectedCategory = Category.categories.first;
  DateTime? selectedDate;
  TimeOfDay? timeOfDay;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void changeCategory(Category category) {
    selectedCategory = category;
    notifyListeners();
  }

  void changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void changeTime(TimeOfDay time) {
    timeOfDay = time;
    notifyListeners();
  }

  CreateEventStates state = CreateEventStates.initial;
  Future<void> createEvent(BuildContext context) async {
    try {
      if (titleController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty &&
          timeOfDay != null &&
          selectedDate != null) {
        state = CreateEventStates.loading;
        notifyListeners();

        await FirebaseFirestoreServices.createEvent(
          Event(
            title: titleController.text,
            description: descriptionController.text,
            categoryId: selectedCategory.id,
            userId: FirebaseAuth.instance.currentUser?.uid ?? "",
            dateTime: DateTime(
              selectedDate!.year,
              selectedDate!.month,
              selectedDate!.day,
              timeOfDay!.hour,
              timeOfDay!.minute,
            ),
          ),
        );
        state = CreateEventStates.success;
        notifyListeners();
        Fluttertoast.showToast(
          msg: "Event created successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        if (context.mounted) Navigator.pop(context);
      }
    } catch (e) {
      state = CreateEventStates.failure;
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      notifyListeners();
    }
  }
}
