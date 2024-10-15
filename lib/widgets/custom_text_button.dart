import 'package:flutter/material.dart';
import 'package:crop_doctor/constants/app_constants.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomTextButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(shape: AppConstants.appShape),
      child: Text(text),
    );
  }
}
