import 'package:flutter/material.dart';

import '../../../../core/router/routes_name.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_constans.dart';
import '../widgets/build_onboarding_widget.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildOnboardingWidget(
      isFirstPage: false,
      isLastPage: true,
      pageNumber: 3,
      onboardingImage: AppImages.onBoarding3,
      title: 'Connect with Friends & Share Moments',
      description: AppConstans.onboardingDescription3,
      buttonText: 'Get started',
      onPressed: () {
        Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
      },
    );
  }
}
