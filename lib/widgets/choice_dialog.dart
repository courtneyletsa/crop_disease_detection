import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crop_doctor/widgets/custom_filled_button.dart';
import 'package:crop_doctor/widgets/custom_text_button.dart';
import 'package:crop_doctor/widgets/default_dialog.dart';

Future showChoiceDialog({
  required String titleMessage,
  required String contentMessage,
  required String yesMessage,
  required String noMessage,
  required VoidCallback onYes,
  required VoidCallback onNo,
  ThemeData? themeData,
}) {
  BuildContext context = Get.context!;

  return showDefaultDialog(
    context: context,
    isDismissible: true,
    title: Text(titleMessage),
    content: Text(contentMessage),
    actions: [
      CustomTextButton(
        onPressed: () {
          Navigator.of(context).pop(false);
          onNo();
        },
        text: noMessage.tr,
      ),
      CustomFilledButton(
        onPressed: () {
          Navigator.of(context).pop(true);
          onYes();
        },
        text: yesMessage.tr,
      )
    ],
  );
}
