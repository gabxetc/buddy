import 'package:buddy_application/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:buddy_application/features/authentication/screens/widgets/onboarding_widgets.dart';
import 'package:buddy_application/utils/constants/colors.dart';
import 'package:buddy_application/utils/constants/image_strings.dart';
import 'package:buddy_application/utils/constants/sizes.dart';
import 'package:buddy_application/utils/constants/text_strings.dart';
import 'package:buddy_application/utils/device/device_utility.dart';
import 'package:buddy_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    
    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scaffolable Pages
          PageView(
            children: const [
              OnBoardingPage(
                image: BImages.onboardingImage1,
                title: BTexts.onBoardingTitle1,
                subTitle: BTexts.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                image: BImages.onboardingImage1,
                title: BTexts.onBoardingTitle1,
                subTitle: BTexts.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                image: BImages.onboardingImage1,
                title: BTexts.onBoardingTitle1,
                subTitle: BTexts.onBoardingSubtitle1,
              )
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
