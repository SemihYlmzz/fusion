import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_detection/keyboard_detection.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    required this.body,
    super.key,
    this.safeArea = false,
    this.safeAreaBottom = false,
    this.safeAreaRight = false,
    this.safeAreaTop = false,
    this.safeAreaLeft = false,
    this.appBar,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.drawerEdgeDragWidth,
    this.drawerScrimColor,
    this.endDrawer,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.persistentFooterButtons,
    this.resizeToAvoidBottomInset,
    this.restorationId,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.primary = true,
    this.onScaffoldTap,
    this.isKeyboardOpen,
  });
  final bool safeArea;
  final bool safeAreaBottom;
  final bool safeAreaRight;
  final bool safeAreaTop;
  final bool safeAreaLeft;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final double? drawerEdgeDragWidth;
  final Color? drawerScrimColor;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final void Function({bool onDrawerChanged})? onDrawerChanged;
  final void Function({bool onEndDrawerChanged})? onEndDrawerChanged;
  final List<Widget>? persistentFooterButtons;
  final bool? resizeToAvoidBottomInset;
  final String? restorationId;
  final Function? onScaffoldTap;
  final DragStartBehavior drawerDragStartBehavior;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final AlignmentDirectional persistentFooterAlignment;
  final bool primary;
  final Widget body;
  final Function(bool)? isKeyboardOpen;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return GestureDetector(
      onTap: () {
        onScaffoldTap?.call();
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: KeyboardDetection(
          controller: KeyboardDetectionController(
            onChanged: isKeyboardOpen,
          ),
          child: Scaffold(
            appBar: appBar,
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            drawer: drawer,
            drawerEdgeDragWidth: drawerEdgeDragWidth,
            drawerScrimColor: drawerScrimColor,
            endDrawer: endDrawer,
            floatingActionButton: floatingActionButton,
            floatingActionButtonAnimator: floatingActionButtonAnimator,
            floatingActionButtonLocation: floatingActionButtonLocation,
            onDrawerChanged: (bool onDrawerChanged) => onDrawerChanged,
            onEndDrawerChanged: (bool onEndDrawerChanged) => onEndDrawerChanged,
            persistentFooterButtons: persistentFooterButtons,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            restorationId: restorationId,
            drawerDragStartBehavior: drawerDragStartBehavior,
            drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
            endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
            extendBody: extendBody,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            persistentFooterAlignment: persistentFooterAlignment,
            primary: primary,
            key: key,
            body: SafeArea(
              bottom: safeArea || safeAreaBottom,
              right: safeArea || safeAreaRight,
              top: safeArea || safeAreaTop,
              left: safeArea || safeAreaLeft,
              child: SizedBox(
                width: size.width,
                child: body,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
