import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/widgets/custom_back_button.dart';
import 'package:evently/features/event_managment/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';

class EventManagmentScreen extends StatefulWidget {
  const EventManagmentScreen({super.key});

  @override
  State<EventManagmentScreen> createState() => _EventManagmentScreenState();
}

class _EventManagmentScreenState extends State<EventManagmentScreen> {
  Category selectedCategory = Category.categories.first;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: const CustomBackButton(),
        title: const Text("Add Event"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorScheme.outline, width: 1),
                image: DecorationImage(
                  image: AssetImage(selectedCategory.imageLight),
                  fit: .cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            DefaultTabController(
              length: Category.categories.length,
              child: TabBar(
                isScrollable: true,
                tabs: Category.categories
                    .map(
                      (category) => CategoryItemWidget(
                        category: category,
                        isSelected: category == selectedCategory,
                      ),
                    )
                    .toList(),

                onTap: (index) {
                  setState(() {
                    selectedCategory = Category.categories[index];
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
