import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crop_doctor/constants/icon_constants.dart';
import 'package:crop_doctor/providers/theme_provider.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Switch(
        value: themeProvider.isDark(),
        onChanged: themeProvider.toggleDarkMode,
        thumbIcon: WidgetStatePropertyAll(Icon(themeProvider.isDark() ? IconConstants.darkModeIcon : IconConstants.lightModeIcon)),
      ),
    );
  }
}
