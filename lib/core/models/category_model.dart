import 'package:flutter/material.dart';

class Category {
  final int id;
  final String nameEn;
  final String nameAr;
  final String imageLight;
  final String imageDark;
  final IconData icon;

  const Category({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.imageLight,
    required this.imageDark,
    required this.icon,
  });

  static final List<Category> allCategories = [
    Category(
      id: 0,
      nameEn: 'All',
      nameAr: 'الكل',
      imageLight: '',
      imageDark: '',
      icon: Icons.grid_view_rounded,
    ),
    Category(
      id: 1,
      nameEn: 'Sport',
      nameAr: 'رياضة',
      imageLight: 'assets/images/light_images/Sport.png',
      imageDark: 'assets/images/dark_images/Sport.png',
      icon: Icons.sports_soccer,
    ),
    Category(
      id: 2,
      nameEn: 'Book Club',
      nameAr: 'نادي الكتاب',
      imageLight: 'assets/images/light_images/Book Club.png',
      imageDark: 'assets/images/dark_images/Book Club.png',
      icon: Icons.menu_book,
    ),
    Category(
      id: 3,
      nameEn: 'Birthday',
      nameAr: 'عيد ميلاد',
      imageLight: 'assets/images/light_images/Birthday.png',
      imageDark: 'assets/images/dark_images/Birthday.png',
      icon: Icons.cake,
    ),
    Category(
      id: 4,
      nameEn: 'Meeting',
      nameAr: 'اجتماع',
      imageLight: 'assets/images/light_images/Meeting.png',
      imageDark: 'assets/images/dark_images/Meeting.png',
      icon: Icons.meeting_room,
    ),
    Category(
      id: 5,
      nameEn: 'Exhibition',
      nameAr: 'معرض',
      imageLight: 'assets/images/light_images/Exhibition.png',
      imageDark: 'assets/images/dark_images/Exhibition.png',
      icon: Icons.museum,
    ),
  ];
  static final List<Category> categories = [
    Category(
      id: 1,
      nameEn: 'Sport',
      nameAr: 'رياضة',
      imageLight: 'assets/images/light_images/Sport.png',
      imageDark: 'assets/images/dark_images/Sport.png',
      icon: Icons.sports_soccer,
    ),
    Category(
      id: 2,
      nameEn: 'Book Club',
      nameAr: 'نادي الكتاب',
      imageLight: 'assets/images/light_images/Book Club.png',
      imageDark: 'assets/images/dark_images/Book Club.png',
      icon: Icons.menu_book,
    ),
    Category(
      id: 3,
      nameEn: 'Birthday',
      nameAr: 'عيد ميلاد',
      imageLight: 'assets/images/light_images/Birthday.png',
      imageDark: 'assets/images/dark_images/Birthday.png',
      icon: Icons.cake,
    ),
    Category(
      id: 4,
      nameEn: 'Meeting',
      nameAr: 'اجتماع',
      imageLight: 'assets/images/light_images/Meeting.png',
      imageDark: 'assets/images/dark_images/Meeting.png',
      icon: Icons.meeting_room,
    ),
    Category(
      id: 5,
      nameEn: 'Exhibition',
      nameAr: 'معرض',
      imageLight: 'assets/images/light_images/Exhibition.png',
      imageDark: 'assets/images/dark_images/Exhibition.png',
      icon: Icons.museum,
    ),
  ];

  static Category getCategoryById(int id) {
    return categories.firstWhere((category) => category.id == id);
  }
}
