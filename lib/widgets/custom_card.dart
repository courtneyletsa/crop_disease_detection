import 'package:flutter/material.dart';
import 'package:crop_doctor/constants/app_constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;

  const CustomCard({super.key, required this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shape: AppConstants.appShape,
      child: child,
    );
  }
}
