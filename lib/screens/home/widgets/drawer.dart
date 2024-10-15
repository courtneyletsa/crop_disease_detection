import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crop_doctor/constants/app_constants.dart';
import 'package:crop_doctor/constants/icon_constants.dart';
import 'package:crop_doctor/providers/nav_provider.dart';
import 'package:crop_doctor/providers/user_provider.dart';
import 'package:crop_doctor/screens/home/widgets/dark_mode_toggle.dart';
import 'package:crop_doctor/screens/home/views/settings/settings_view.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    NavProvider navProvider = context.watch<NavProvider>();
    UserProvider userProvider = context.watch<UserProvider>();

    return NavigationDrawer(
      selectedIndex: navProvider.getBottomNavIndex(),
      onDestinationSelected: (value) async {
        navProvider.closeDrawer();
        await Future.delayed(AppConstants.animationDuration, () async {
          navProvider.setBottomNavIndex(value);
        });
      },
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            userProvider.getUserName(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          accountEmail: Text(
            userProvider.randomPersonData!.email!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(userProvider.randomPersonData!.picture!.large!),
          ),
          arrowColor: Theme.of(context).colorScheme.primary,
          otherAccountsPictures: const [DarkModeToggle()],
          onDetailsPressed: () {
            navProvider.closeDrawer();
            navProvider.setBottomNavIndex(SettingsView.routeIndex);
          },
          decoration: const BoxDecoration(color: Colors.transparent),
        ),
        const SizedBox(height: 8),
        const NavigationDrawerDestination(
          label: Text('Home'),
          icon: Icon(IconConstants.homeIcon),
          selectedIcon: Icon(IconConstants.homeSelectedIcon),
        ),
        const NavigationDrawerDestination(
          label: Text('Settings'),
          icon: Icon(IconConstants.settingsIcon),
          selectedIcon: Icon(IconConstants.settingsSelectedIcon),
        ),
      ],
    );
  }
}
