import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crop_doctor/constants/icon_constants.dart';
import 'package:crop_doctor/screens/home/views/settings/widgets/settings_tile.dart';
import 'package:crop_doctor/screens/legal/legal_screen.dart';

class LicenceSetting extends StatelessWidget {
  const LicenceSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      onTap: () => Get.to(() => const LegalScreen()),
      leadingIcon: IconConstants.licenceIcon,
      title: 'Licenses',
      subtitle: 'View the application licenses',
      trailing: const Icon(IconConstants.forwardIcon),
    );
  }
}
