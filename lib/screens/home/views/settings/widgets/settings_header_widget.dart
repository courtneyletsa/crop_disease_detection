import 'package:flutter/material.dart';

class SettingsHeaderWidget extends StatelessWidget {
  final String text;

  const SettingsHeaderWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      selected: true,
    );
  }
}
