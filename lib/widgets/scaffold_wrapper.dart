import 'package:flutter/material.dart';
import 'package:crop_doctor/utils/utils.dart';

class ScaffoldWrapper extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final List<Widget>? persistentFooterButtons;
  final bool? shouldSafeAreaTop;
  final bool? shouldSafeAreaBottom;
  final bool? canPop;
  final Function(bool)? onDrawerChanged;
  final void Function(bool, dynamic)? onPopInvokedWithResult;

  const ScaffoldWrapper({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.drawer,
    this.shouldSafeAreaTop,
    this.shouldSafeAreaBottom,
    this.canPop,
    this.onPopInvokedWithResult,
    this.endDrawer,
    this.onDrawerChanged,
    this.persistentFooterButtons,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: shouldSafeAreaTop ?? false,
      bottom: shouldSafeAreaBottom ?? false,
      child: PopScope(
        canPop: canPop ?? true,
        onPopInvokedWithResult: onPopInvokedWithResult,
        child: GestureDetector(
          onTap: () {
            Utils.dismissKeyboard();
          },
          child: Scaffold(
            drawer: drawer,
            endDrawer: endDrawer,
            onDrawerChanged: onDrawerChanged,
            appBar: appBar,
            body: body,
            floatingActionButton: floatingActionButton,
            bottomSheet: bottomSheet,
            bottomNavigationBar: bottomNavigationBar,
            persistentFooterAlignment: AlignmentDirectional.center,
            persistentFooterButtons: persistentFooterButtons,
          ),
        ),
      ),
    );
  }
}
