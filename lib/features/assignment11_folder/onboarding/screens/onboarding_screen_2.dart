import 'package:flutter/material.dart';

import '../../../../core/router/routes_name.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_constans.dart';
import '../widgets/build_onboarding_widget.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildOnboardingWidget(
      isFirstPage: false,
      isLastPage: false,
      pageNumber: 2,
      onboardingImage: AppImages.onBoarding2,
      title: 'Effortless Event Planning',
      description: AppConstans.onboardingDescription2,
      buttonText: 'Next',
      onPressed: () {
        Navigator.pushNamed(context, RoutesName.onboardingScreen3);
      },
    );
  }
}
