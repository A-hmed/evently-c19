import 'package:evently/core/models/user_model.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/firebase_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;
      if (FirebaseAuth.instance.currentUser != null) {
        UserModel.currentUser = await FirebaseServices.getUserFromFirestore(
          FirebaseAuth.instance.currentUser!.uid,
        );
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, RoutesName.mainLayoutScreen);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(),
            Image.asset(AppImages.logo, width: width * .8),
            Column(
              children: [
                Image.asset(AppImages.routeLogo, width: width * .2),
                const SizedBox(height: 16),
                Text('Supervised by Mohamed Nabil'),
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
