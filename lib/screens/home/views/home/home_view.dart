import 'package:flutter/material.dart';
import 'package:crop_doctor/screens/home/widgets/do_something_fab.dart';
import 'package:crop_doctor/widgets/scaffold_wrapper.dart';

class HomeView extends StatelessWidget {
  static const int routeIndex = 0;

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWrapper(
      body: Center(child: Text('Do Something Here')),
      floatingActionButton: DoSomethingFAB(),
    );
  }
}
