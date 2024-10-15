import 'package:flutter/material.dart';
import 'package:crop_doctor/widgets/loading_widget.dart';
import 'package:crop_doctor/widgets/scaffold_wrapper.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWrapper(
      body: LoadingWidget(),
    );
  }
}
