import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crop_doctor/constants/icon_constants.dart';
import 'package:crop_doctor/providers/app_provider.dart';
import 'package:crop_doctor/screens/home/views/settings/widgets/settings_tile.dart';

class VersionSetting extends StatelessWidget {
  const VersionSetting({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = context.watch<AppProvider>();

    return SettingsTile(
      leadingIcon: IconConstants.versionIcon,
      subtitle: appProvider.getAppVersion(),
      title: 'Version',
    );
  }
}
