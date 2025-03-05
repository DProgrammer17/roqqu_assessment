import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';
import 'package:roqqu_assessment/widgets/page_widgets/screen_loader.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? appBarContent;
  final Widget? bottomSheet;
  final FloatingActionButton? actionButton;
  final FloatingActionButtonLocation? actionButtonLocation;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool centerTile;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final double?toolbarHeight;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;
  final Widget? drawer;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Color? drawerScrimColor;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final ValueNotifier<bool>? isLoading;

  const AppScaffold({
    Key? key,
    this.appBar,
    required this.body,
    this.appBarContent,
    this.bottomSheet,
    this.actionButton,
    this.actionButtonLocation,
    this.backgroundColor,
    this.padding,
    this.toolbarHeight,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.isLoading,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.centerTile = false,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLoader(
      isLoading: isLoading ?? ValueNotifier(false),
      child: CupertinoScaffold(
        body: Builder(
            builder: (context) {
              return Scaffold(
                backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
                extendBody: extendBody,
                extendBodyBehindAppBar: extendBodyBehindAppBar,
                appBar: appBar ?? AppBar(
                  toolbarHeight: toolbarHeight ?? AppConstants.size.toolBarHeight,
                  backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  centerTitle: centerTile,
                  title: appBarContent,
                ),
                body: Padding(
                  padding: padding ?? EdgeInsets.symmetric(horizontal: 20.aw),
                  child: body,
                ),
                bottomSheet: Padding(
                  padding: padding ?? EdgeInsets.symmetric(horizontal: 20.aw),
                  child: bottomSheet,
                ),
                floatingActionButton: actionButton,
                floatingActionButtonLocation: actionButtonLocation,
                floatingActionButtonAnimator: floatingActionButtonAnimator,
                persistentFooterButtons: persistentFooterButtons,
                //persistentFooterAlignment: persistentFooterAlignment,
                drawer: drawer,
                onDrawerChanged: onDrawerChanged,
                endDrawer: endDrawer,
                onEndDrawerChanged: onEndDrawerChanged,
                drawerScrimColor: drawerScrimColor,
                bottomNavigationBar: bottomNavigationBar,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
                primary: primary,
                drawerDragStartBehavior: drawerDragStartBehavior,
                drawerEdgeDragWidth: drawerEdgeDragWidth,
                drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
                endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
                restorationId: restorationId,
              );
            }
        ),
      ),
    );
  }
}