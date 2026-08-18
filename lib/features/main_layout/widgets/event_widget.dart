import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/services/firebase_firestore_services.dart';

class EventWidget extends StatefulWidget {
  final Event event;

  const EventWidget(this.event, {super.key});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  ///Lazy initialization
  late ThemeData theme = Theme.of(context);

  @override
  Widget build(BuildContext context) {
    var category = Category.getCategoryById(widget.event.categoryId);
    String shortMonth = DateFormat.MMM().format(widget.event.dateTime);

    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * .23,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(category.imageLight),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "${widget.event.dateTime.day} ${shortMonth}",
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    widget.event.title,
                    style: theme.textTheme.labelMedium!,
                  ),
                ),
                buildFavoriteBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFavoriteBtn() {
    return InkWell(
      onTap: () {
        if (UserModel.currentUser.isFavorite(widget.event.id)) {
          FirebaseFirestoreServices.removeEventFromFavorite(widget.event.id);
        } else {
          FirebaseFirestoreServices.addEventToFavorite(widget.event.id);
        }
        setState(() {});
      },
      child: Icon(
        UserModel.currentUser.isFavorite(widget.event.id)
            ? Icons.favorite
            : Icons.favorite_border,
        color: theme.primaryColor,
      ),
    );
  }
}
