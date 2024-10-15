import 'dart:math';

import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crop_doctor/services/local_storage_service.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeMode themeMode;

  ThemeProvider() {
    initThemeMode();
  }

  // generates a random color on each startup just for fun and to demonstrate dynamic themeing
  static Color getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];

  static final Color seedColor = getRandomColor();

  static final TextTheme textTheme = GoogleFonts.afacadTextTheme();

  static const DynamicSchemeVariant dynamicSchemeVariant = DynamicSchemeVariant.fruitSalad;

  static final ThemeData appTheme = ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: seedColor), textTheme: textTheme);

  static final ColorScheme lightColorScheme = SeedColorScheme.fromSeeds(primaryKey: seedColor, brightness: Brightness.light, tones: FlexTones.vivid(Brightness.light));

  static final ColorScheme darkColorScheme = SeedColorScheme.fromSeeds(primaryKey: seedColor, brightness: Brightness.dark, tones: FlexTones.vivid(Brightness.dark));

  static final ThemeData lightThemeData = ThemeData.from(colorScheme: lightColorScheme);

  static final ThemeData darkThemeData = ThemeData.from(colorScheme: darkColorScheme);

  static ThemeMode getSystemTheme() => SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;

  bool isDark() => themeMode == ThemeMode.dark;

  void initThemeMode() {
    switch (LocalStorageService.getDarkModePreference()) {
      case true:
        themeMode = ThemeMode.dark;
      case false:
        themeMode = ThemeMode.light;
      default:
        themeMode = ThemeProvider.getSystemTheme();
    }
  }

  void toggleDarkMode(bool value) {
    themeMode = value ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);

    LocalStorageService.setDarkModePreference(value);

    notifyListeners();
  }
}
