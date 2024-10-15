import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showSnackBar(String message) {
    Future.delayed(Duration.zero, () {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }
}
