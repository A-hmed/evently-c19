import 'package:flutter/material.dart';

import '../../../../core/router/routes_name.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_constans.dart';
import '../widgets/build_onboarding_widget.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildOnboardingWidget(
      isFirstPage: true,
      isLastPage: false,
      pageNumber: 1,
      onboardingImage: AppImages.onBoarding1,
      title: 'Find Events That Inspire You',
      description: AppConstans.onboardingDescription1,
      buttonText: 'Next',
      onPressed: () {
        Navigator.pushNamed(context, RoutesName.onboardingScreen2);
      },
    );
  }
}
