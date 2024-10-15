import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:crop_doctor/constants/app_constants.dart';

class StaggeredAnimationColumnWrapper extends StatelessWidget {
  final List<Widget> children;

  const StaggeredAnimationColumnWrapper({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: AppConstants.animationDuration,
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: children,
          ),
        ),
      ),
    );
  }
}
