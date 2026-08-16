import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/router/app_router.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/services/shared_pref_service.dart';
import 'package:evently/core/utils/app_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_assets.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/page_indecator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _finishOnboarding() {
    SharedPrefService.setBool(AppConstans.onboardingSeenKey, true);
    Navigator.pushReplacementNamed(context, RoutesName.appConfigScreen);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final pages = [
      OnboardingPageModel(
        // icon: Icons.explore_rounded,
        image: SvgPicture.asset(
          AppImages.onboarding1,
          colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
        ),
        title: l10n.onboardingTitle1,
        subtitle: l10n.onboardingSubtitle1,
      ),
      OnboardingPageModel(
        // icon: Icons.edit_calendar_rounded,
        image: SvgPicture.asset(
          AppImages.onboarding2,
          colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
        ),
        title: l10n.onboardingTitle2,
        subtitle: l10n.onboardingSubtitle2,
      ),
      OnboardingPageModel(
        // icon: Icons.notifications_active_rounded,
        image: SvgPicture.asset(
          AppImages.onboarding3,
          colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
        ),
        title: l10n.onboardingTitle3,
        subtitle: l10n.onboardingSubtitle3,
      ),
    ];

    final isLastPage = currentPage == pages.length - 1;
    final isFirstPage = currentPage == 0;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                      // SizedBox(height: 20,),
                height: 25,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    children: [
                      Visibility(
                        visible: !isFirstPage,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: TextButton(
                          onPressed: _finishOnboarding,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushReplacementNamed(context,RoutesName.onboardingScreen),
                            child: Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                        ),
                      ),
                      Spacer(),
                      Image.asset(AppImages.logo),
                      Spacer(),
                      Visibility(
                        visible: !isLastPage,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: ElevatedButton(
                          onPressed: _finishOnboarding,
                          child: Text(l10n.skip,style: textTheme.bodyLarge?.copyWith(color: colorScheme.primary),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 15),
              Expanded(
                flex: 9,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() => currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPageWidget(page: pages[index]);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: .center,
                children: List.generate(
                  pages.length,
                  (index) => PageIndicatorDot(isActive: index == currentPage),
                ),
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  if (isLastPage) {
                    Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(isLastPage ? l10n.getStarted : l10n.next),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
