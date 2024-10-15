import 'package:flutter/material.dart';
import 'package:crop_doctor/constants/app_constants.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomFilledButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(shape: AppConstants.appShape),
      child: Text(text),
    );
  }
}
