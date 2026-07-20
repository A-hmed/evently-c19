import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, RoutesName.appConfigScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            const Row(),
            Image.asset(AppImages.logo, width: width * .8),
            Column(
              spacing: 16,
              children: [
                Image.asset(AppImages.routeLogo, width: width * .2),
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
