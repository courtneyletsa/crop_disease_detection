import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crop_doctor/providers/nav_provider.dart';
import 'package:crop_doctor/providers/user_provider.dart';
import 'package:crop_doctor/screens/home/views/home/home_view.dart';
import 'package:crop_doctor/screens/home/widgets/bottom_nav.dart';
import 'package:crop_doctor/screens/home/widgets/drawer.dart';
import 'package:crop_doctor/screens/home/views/settings/settings_view.dart';
import 'package:crop_doctor/widgets/loading_screen.dart';
import 'package:crop_doctor/widgets/scaffold_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.watch<UserProvider>();
    NavProvider navProvider = context.watch<NavProvider>();

    if (!userProvider.hasUser()) {
      return const LoadingScreen();
    }

    return ScaffoldWrapper(
      drawer: const HomeDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar.large(
              title: Text(navProvider.getTitleText()),
            ),
          ];
        },
        body: PageView(
          onPageChanged: navProvider.setPageViewIndex,
          controller: navProvider.bottomNavPageController,
          children: const [
            HomeView(),
            SettingsView(),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNav(),
    );
  }
}
