import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/router/routes_name.dart';
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
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: tabs[selectedTab],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.eventManagmentScreen);
        },
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
              icon: const Icon(IconsaxPlusLinear.home_1),
              activeIcon: const Icon(IconsaxPlusBold.home_1),
              label: locale.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(IconsaxPlusLinear.heart),
              activeIcon: const Icon(IconsaxPlusBold.heart),
              label: locale.favorite,
            ),
            BottomNavigationBarItem(
              icon: const Icon(IconsaxPlusLinear.user),
              activeIcon: const Icon(IconsaxPlusBold.user),
              label: locale.profile,
            ),
          ],
        ),
      ),
    );
  }
}
