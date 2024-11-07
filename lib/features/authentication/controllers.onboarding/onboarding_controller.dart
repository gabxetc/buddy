import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();
}

/// Variables
final pageController = PageController();


/// Update Current Index when Page Scroll
void updatePageIndicate(index) {}

/// Jump to the specific dot selected page
void dotNavigationClick(index) {}

/// Update Current Index and Jump to next page
void nextPage() {}

/// Update current index and jump to last page
void skipPage() {}
