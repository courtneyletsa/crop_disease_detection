import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:crop_doctor/constants/app_constants.dart';
import 'package:crop_doctor/providers/theme_provider.dart';
import 'package:crop_doctor/screens/onboarding/onboarding.dart';

class CropDoctor extends StatelessWidget {
  const CropDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeProvider.lightThemeData,
      darkTheme: ThemeProvider.darkThemeData,
      themeMode: themeProvider.themeMode,
      home: const OnboardingScreen(),
    );
  }
}
