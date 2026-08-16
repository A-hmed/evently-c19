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

  Event? eventToEdit;
  bool get isEditMode => eventToEdit != null;

  /// Pre-fills the form with an existing event's data so the same screen
  /// can be reused for editing. Safe to call with null (no-op), which
  /// keeps the provider in "create" mode.
  void initForEdit(Event? event) {
    if (event == null) return;
    eventToEdit = event;
    titleController.text = event.title ?? '';
    descriptionController.text = event.description ?? '';
    selectedCategory = Category.categories.firstWhere(
          (category) => category.id == event.categoryId,
      orElse: () => Category.categories.first,
    );
    selectedDate = event.dateTime;
    if (event.dateTime != null) {
      timeOfDay = TimeOfDay(
        hour: event.dateTime!.hour,
        minute: event.dateTime!.minute,
      );
    }
  }

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
  Future<void> submitEvent(BuildContext context) async {
    try {
      if (titleController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty &&
          timeOfDay != null &&
          selectedDate != null) {
        state = CreateEventStates.loading;
        notifyListeners();

        final event = Event(
          id: eventToEdit?.id,
          title: titleController.text,
          description: descriptionController.text,
          categoryId: selectedCategory.id,
          userId:
          eventToEdit?.userId ??
              FirebaseAuth.instance.currentUser?.uid ??
              "",
          dateTime: DateTime(
            selectedDate!.year,
            selectedDate!.month,
            selectedDate!.day,
            timeOfDay!.hour,
            timeOfDay!.minute,
          ),
        );

        if (isEditMode) {
          await FirebaseFirestoreServices.updateEvent(event);
        } else {
          await FirebaseFirestoreServices.createEvent(event);
        }

        state = CreateEventStates.success;
        notifyListeners();
        Fluttertoast.showToast(
          msg: isEditMode
              ? "Event updated successfully"
              : "Event created successfully",
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