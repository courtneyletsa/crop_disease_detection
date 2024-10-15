import 'package:flutter/material.dart';
import 'package:crop_doctor/constants/app_constants.dart';

Future showDefaultDialog({
  required BuildContext context,
  required bool isDismissible,
  required Widget title,
  required Widget content,
  required List<Widget> actions,
  Widget? icon,
  EdgeInsets? contentPadding,
  EdgeInsets? titlePadding,
  EdgeInsets? actionsPadding,
}) {
  return showDialog(
    context: context,
    barrierDismissible: isDismissible,
    builder: (context) {
      return AlertDialog(
        shape: AppConstants.appShape,
        contentPadding: contentPadding,
        titlePadding: titlePadding,
        actionsPadding: actionsPadding,
        title: title,
        content: content,
        actions: actions,
        icon: icon,
      );
    },
  );
}
