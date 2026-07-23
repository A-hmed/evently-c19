import 'package:evently/features/main_layout/tabs/favorites_tab/screen/favorite_tab.dart';
import 'package:evently/features/main_layout/tabs/home_tab/screen/home_tab.dart';
import 'package:evently/features/main_layout/tabs/profile_tab/screen/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int selectedTab = 0;

  List<Widget> tabs = const [HomeTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedTab],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(24),
        child: BottomNavigationBar(
          onTap: (index) {
            selectedTab = index;
            setState(() {});
          },
          currentIndex: selectedTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(IconsaxPlusLinear.home_1),
              activeIcon: Icon(IconsaxPlusBold.home_1),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconsaxPlusLinear.heart),
              activeIcon: Icon(IconsaxPlusBold.heart),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconsaxPlusLinear.user),
              activeIcon: Icon(IconsaxPlusBold.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
