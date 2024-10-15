import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crop_doctor/constants/app_constants.dart';
import 'package:crop_doctor/constants/icon_constants.dart';
import 'package:crop_doctor/providers/nav_provider.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    NavProvider navProvider = context.watch<NavProvider>();

    return NavigationBar(
      animationDuration: AppConstants.animationDuration,
      selectedIndex: navProvider.getBottomNavIndex(),
      onDestinationSelected: navProvider.setBottomNavIndex,
      destinations: const [
        NavigationDestination(
          label: 'Home',
          icon: Icon(IconConstants.homeIcon),
          selectedIcon: Icon(IconConstants.homeSelectedIcon),
        ),
        NavigationDestination(
          label: 'Settings',
          icon: Icon(IconConstants.settingsIcon),
          selectedIcon: Icon(IconConstants.settingsSelectedIcon),
        ),
      ],
    );
  }
}
