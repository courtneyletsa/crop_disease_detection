import 'package:flutter/material.dart';
import 'package:crop_doctor/screens/home/views/settings/application/widgets/licences.dart';
import 'package:crop_doctor/screens/home/views/settings/application/widgets/version.dart';
import 'package:crop_doctor/screens/home/views/settings/general/widgets/dark_mode.dart';
import 'package:crop_doctor/screens/home/views/settings/widgets/settings_header_widget.dart';
import 'package:crop_doctor/widgets/staggered_animation_column_wrapper.dart';

class SettingsView extends StatelessWidget {
  static const routeIndex = 1;

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const StaggeredAnimationColumnWrapper(
      children: [
        SettingsHeaderWidget(text: 'Application'),
        DarkModeSettings(),
        SettingsHeaderWidget(text: 'About'),
        VersionSetting(),
        LicenceSetting(),
      ],
    );
  }
}
