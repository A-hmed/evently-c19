import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/models/user_model.dart';
import 'package:evently/core/services/firebase_firestore_services.dart';
import 'package:evently/features/event_managment/widgets/category_item_widget.dart';
import 'package:evently/features/main_layout/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Category selectedCategory = Category.allCategories[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Welcome Back ✨"), Text(UserModel.currentUser.name)],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.brightness_5)),
          IconButton(onPressed: () {}, icon: Icon(Icons.language)),
        ],
      ),
      body: StreamBuilder<List<Event>>(
        stream: FirebaseFirestoreServices.getEventsList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          } else if (snapshot.hasData) {
            return Column(
              children: [
                DefaultTabController(
                  length: Category.allCategories.length,
                  child: TabBar(
                    isScrollable: true,
                    tabs: Category.allCategories
                        .map(
                          (category) => CategoryItemWidget(
                            category: category,
                            isSelected: category == selectedCategory,
                          ),
                        )
                        .toList(),

                    onTap: (index) {
                      selectedCategory = Category.allCategories[index];
                      setState(() {});
                    },
                  ),
                ),
                buildEventsList(snapshot.requireData),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildEventsList(List<Event> events) {
    List<Event> filteredEvents = events;
    if (selectedCategory != Category.allCategories[0]) {
      filteredEvents = events
          .where((event) => event.categoryId == selectedCategory.id)
          .toList();
    }
    if(filteredEvents.isEmpty){
      return Center(child: Text("No Events Found"));
    }
    return Expanded(
      child: ListView.builder(
        itemCount: filteredEvents.length,
        itemBuilder: (context, index) {
          return EventWidget(filteredEvents[index]);
        },
      ),
    );
  }
}
