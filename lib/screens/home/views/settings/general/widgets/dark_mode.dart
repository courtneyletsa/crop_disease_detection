import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crop_doctor/constants/icon_constants.dart';
import 'package:crop_doctor/providers/theme_provider.dart';
import 'package:crop_doctor/screens/home/views/settings/widgets/settings_tile.dart';

class DarkModeSettings extends StatelessWidget {
  const DarkModeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();

    return SettingsTile(
      leadingIcon: themeProvider.isDark() ? IconConstants.darkModeIcon : IconConstants.lightModeIcon,
      title: 'Dark Mode',
      subtitle: themeProvider.isDark() ? 'Dark mode is enabled' : 'Dark mode is disabled',
      trailing: Switch(
        onChanged: themeProvider.toggleDarkMode,
        value: themeProvider.isDark(),
      ),
    );
  }
}
