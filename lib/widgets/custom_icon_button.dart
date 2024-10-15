import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const CustomIconButton({super.key, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
