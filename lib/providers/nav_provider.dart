import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:crop_doctor/constants/app_constants.dart';
import 'package:crop_doctor/providers/user_provider.dart';
import 'package:crop_doctor/screens/home/views/home/home_view.dart';
import 'package:crop_doctor/screens/home/views/settings/settings_view.dart';

class NavProvider with ChangeNotifier {
// home bottom nav
  int bottomNavIndex = HomeView.routeIndex;

  PageController bottomNavPageController = PageController(initialPage: HomeView.routeIndex, keepPage: true);

  int getBottomNavIndex() {
    return bottomNavIndex;
  }

  Future<void> setBottomNavIndex(int index) async {
    if (bottomNavIndex != index) {
      bottomNavIndex = index;

      await bottomNavPageController.animateToPage(
        index,
        duration: AppConstants.animationDuration,
        curve: AppConstants.animationCurve,
      );
    }
  }

  void setPageViewIndex(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }

  String getTitleText() {
    switch (bottomNavIndex) {
      case HomeView.routeIndex:
        return 'Welcome, ${Get.context!.read<UserProvider>().getUserName()}';
      case SettingsView.routeIndex:
        return 'Settings';
      default:
        return AppConstants.appName;
    }
  }

  bool isScreenActive(int screenIndex) {
    return bottomNavIndex == screenIndex;
  }

  // drawer
  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void closeDrawer() {
    Get.back();
  }
}
