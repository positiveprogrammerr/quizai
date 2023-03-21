import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:quizai/page/dashboard/dashboard_screen.dart';
import 'package:quizai/page/home/home_screen.dart';
import 'package:quizai/page/notification/notification_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_app_bar.dart';
import 'package:quizai/widget/app_icon_button.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({
    Key? key,
    required this.body,
    this.mainPages = false,
    this.appBarTitle,
    this.withBackButton = true,
    this.bottomNavigation,
    this.trailingAppBar,
    this.height = false,
    this.bottomSize = kToolbarHeight,
    this.subTitle = '',
    this.subTitleDesc = '',
    this.extendBodyBehindAppBar = false,
    this.bottomSheet,
    this.backgroundColor = AppColors.bgColorWhite,
    this.scrollPhysics,
    this.appBarBackground = AppColors.mainBlue,
    this.appBarHeight,
    this.leading,
    this.flexibleSpace,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);
  final Widget body;
  final String? appBarTitle;
  final bool withBackButton;
  final bool mainPages;
  final Widget? bottomNavigation;
  final Widget? trailingAppBar;
  final Widget? bottomSheet;
  final Widget? leading;
  final Widget? flexibleSpace;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool height;
  final bool extendBodyBehindAppBar;
  final double bottomSize;
  final String subTitle;
  final Color backgroundColor;
  final Color appBarBackground;

  final String subTitleDesc;
  final double? appBarHeight;
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBarTitle == null ? null : buildAppAppBar(context),
      backgroundColor: backgroundColor,
      body: body,
      bottomNavigationBar: bottomNavigation,
      bottomSheet: bottomSheet,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  AppAppBar buildAppAppBar(BuildContext context) {
    return AppAppBar(
      title: appBarTitle ?? '',
      showBack: withBackButton,
      bottom: height,
      appBarHeight: appBarHeight,
      bottomsize: bottomSize,
      bottomtitle: subTitle,
      subtitle: subTitleDesc,
      leading: mainPages
          ? AppIconButton(
              onPressed: () {
                advancedDrawerController.showDrawer();
              },
              icon: Icons.grid_view_rounded,
            )
          : leading,
      backgroundColor: appBarBackground,
      flexibleSpace: flexibleSpace,
      actions: mainPages
          ? [
              AppIconButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()),
                ),
                icon: Icons.notifications,
              )
            ]
          : trailingAppBar == null
              ? []
              : [
                  trailingAppBar!,
                ],
    );
  }
}
