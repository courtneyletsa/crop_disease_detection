import 'package:flutter/material.dart';
import 'package:crop_doctor/constants/icon_constants.dart';

class DoSomethingFAB extends StatelessWidget {
  const DoSomethingFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: UniqueKey(),
      onPressed: () {},
      child: const Icon(IconConstants.createNewIcon),
    );
  }
}
