import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/router/routes_name.dart';
import '../../../../core/utils/app_assets.dart';

class BuildOnboardingWidget extends StatelessWidget {
  final bool isFirstPage;
  final bool isLastPage;
  final int pageNumber;
  final String onboardingImage;
  final String title;
  final String description;
  final String buttonText;

  final void Function() onPressed;

  const BuildOnboardingWidget(
      {super.key,
      required this.isFirstPage,
      required this.isLastPage,
      required this.pageNumber,
      required this.onboardingImage,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final PageController controller = PageController(
      initialPage: pageNumber - 1,
    );
    return Scaffold(
      appBar: AppBar(
        leading: isFirstPage
            ? null
            : IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: colorScheme.primary,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
        title: Image.asset(
          AppImages.logo,
          width: MediaQuery.sizeOf(context).width * .4,
        ),
        actions: isLastPage
            ? null
            : [
                InkWell(
                  child: Text('skip', style: textTheme.displaySmall),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesName.loginScreen);
                  },
                ),
                SizedBox(
                  width: 16,
                )
              ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  onboardingImage,
                  colorFilter: ColorFilter.mode(
                    colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: colorScheme.primary,
                  dotColor: colorScheme.onSurface,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 6,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: textTheme.displayLarge,
            ),
            SizedBox(
              height: 8,
            ),
            Text(description),
            SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
