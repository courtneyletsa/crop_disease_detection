import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:crop_doctor/constants/app_constants.dart';

class StaggeredAnimationBuilderWrapper extends StatelessWidget {
  final int index;
  final Widget child;

  const StaggeredAnimationBuilderWrapper({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: AppConstants.animationDuration,
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
