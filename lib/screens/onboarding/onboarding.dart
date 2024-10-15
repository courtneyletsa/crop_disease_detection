import 'package:animated_introduction/animated_introduction.dart';
import 'package:crop_doctor/constants/app_constants.dart';
import 'package:crop_doctor/providers/app_provider.dart';
import 'package:crop_doctor/providers/user_provider.dart';
import 'package:crop_doctor/screens/home/home_screen.dart';
import 'package:crop_doctor/widgets/scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserProvider>().initRandomUser();
    context.read<AppProvider>().getPackageInfo();
  }

  static bool imageWithBubble = false;
  static double imageHeightMultiple = Get.height;
  static EdgeInsets slidePagePadding = EdgeInsets.zero;

  static List<SingleIntroScreen> pages = [
    SingleIntroScreen(
      title: 'Welcome to ${AppConstants.appName}',
      description: 'Empowering farmers with AI technology. Monitor your crops effortlessly by just uploading a picture',
      imageAsset: 'assets/images/2.jpg',
      imageWithBubble: imageWithBubble,
      imageHeightMultiple: imageHeightMultiple,
      slidePagePadding: slidePagePadding,
    ),
    SingleIntroScreen(
      title: 'Diagnose Crop Health',
      description: 'Our advanced AI instantly analyzes your crops to detect diseases, ensuring early intervention and healthier yields',
      imageAsset: 'assets/images/1.jpg',
      imageWithBubble: imageWithBubble,
      imageHeightMultiple: imageHeightMultiple,
      slidePagePadding: slidePagePadding,
    ),
    SingleIntroScreen(
      title: 'Take Action Early',
      description: 'Get actionable insights and expert advice based on AI analysis to protect your crops and boost productivity',
      imageAsset: 'assets/images/3.jpg',
      imageWithBubble: imageWithBubble,
      imageHeightMultiple: imageHeightMultiple,
      slidePagePadding: slidePagePadding,
    ),
  ];

  void goToHome() => Get.offAll(() => const HomeScreen());

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: AnimatedIntroduction(
        containerBg: Theme.of(context).scaffoldBackgroundColor,
        footerBgColor: Theme.of(context).scaffoldBackgroundColor,
        textColor: Theme.of(context).colorScheme.onSurface,
        activeDotColor: Theme.of(context).colorScheme.primary,
        inactiveDotColor: Theme.of(context).colorScheme.inversePrimary,
        footerRadius: AppConstants.appBorderRadiusValue,
        slides: pages,
        indicatorType: IndicatorType.circle,
        nextText: 'Next',
        doneText: 'Begin',
        skipText: 'Skip',
        onDone: goToHome,
        onSkip: goToHome,
      ),
    );
  }
}
