import 'package:buddy_application/utils/constants/colors.dart';
import 'package:buddy_application/utils/constants/sizes.dart';
import 'package:buddy_application/utils/device/device_utility.dart';
import 'package:buddy_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: BHelperFunctions.screenWidth() * 0.8,
              height: BHelperFunctions.screenHeight() * 0.6,
              image: AssetImage(image)),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: BSizes.spaceBetweenItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: BDeviceUtils.getAppBarHeight(),
      right: BSizes.defaultSpace,
      child: TextButton(onPressed: () {}, child: const Text('Skip')),
    );
  }
}

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = BHelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: BDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: BSizes.defaultSpace,
        child: SmoothPageIndicator(
            controller: PageController(),
            count: 3,
            effect: ExpandingDotsEffect(
                activeDotColor: dark ? BColors.light : BColors.dark, dotHeight: 6)));
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = BHelperFunctions.isDarkMode(context);

    return Positioned(
        right: BSizes.defaultSpace,
        bottom: BDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? BColors.primaryColor : BColors.dark),
            child: const Icon(Iconsax.arrow_right_3)));
  }
}
