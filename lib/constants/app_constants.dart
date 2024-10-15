import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Crop Doctor';

  static const double appBorderRadiusValue = 16.0;
  static const int animationDurationValue = 250;

  static const Duration animationDuration = Duration(milliseconds: animationDurationValue);

  static final BorderRadius appBorderRadius = BorderRadius.circular(appBorderRadiusValue);

  static final RoundedRectangleBorder appShape = RoundedRectangleBorder(borderRadius: appBorderRadius);

  static const Curve animationCurve = Curves.easeInOut;

  static final AnimationStyle expansionTileAnimationStyle = AnimationStyle(
    curve: AppConstants.animationCurve,
    reverseCurve: AppConstants.animationCurve,
  );
}
