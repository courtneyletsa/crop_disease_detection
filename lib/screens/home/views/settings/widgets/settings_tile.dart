import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool? enabled;
  final IconData leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    this.trailing,
    this.onTap,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      enabled: enabled ?? true,
      leading: Icon(leadingIcon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing,
    );
  }
}
