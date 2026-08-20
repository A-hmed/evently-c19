import 'package:evently/core/l10n/app_localizations.dart';
import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.pushReplacementNamed(context, RoutesName.appConfigScreen);
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final List<OnboardingData> pages = [
      OnboardingData(
        title: locale.findEvent,
        description: locale.findEventDescription,
        image: AppImages.onboarding1,       ),
      OnboardingData(
        title: locale.effortlessPlanning,
        description: locale.effortlessPlanningDescription,
        image: AppImages.onboarding2,
      ),
      OnboardingData(
        title: locale.connectWithFriends,
        description: locale.connectWithFriendsDescription,
        image: AppImages.onboarding3,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios, size: 20),
                      color: colorScheme.primary,
                    )
                  else
                    const SizedBox(width: 48),
                  Image.asset(AppImages.logo, height: 30),
                  if (_currentPage < 2)
                    TextButton(
                      onPressed: _finishOnboarding,
                      child: Text(
                        locale.skip,
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 48),
                ],
              ),
            ),
            // Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPageContent(
                    data: pages[index],
                    textTheme: textTheme,
                  );
                },
              ),
            ),
            // Dot Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? colorScheme.primary
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _onNext,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _currentPage == 2 ? locale.getStarted : locale.next,
                    style: textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingPageContent extends StatelessWidget {
  final OnboardingData data;
  final TextTheme textTheme;

  const OnboardingPageContent({
    super.key,
    required this.data,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              data.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            data.title,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            data.description,
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
