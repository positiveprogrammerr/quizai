import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_icon_button.dart';
import 'package:quizai/widget/app_shadow.dart';
import 'package:quizai/widget/app_text_style.dart';

class AppAppBar extends StatelessWidget with PreferredSizeWidget {
  const AppAppBar({
    Key? key,
    this.showBack = true,
    this.centerTitle = true,
    this.showLeading = false,
    this.title = "",
    this.backgroundColor,
    this.leading,
    this.titleWidget,
    this.actions,
    this.listenableTitle,
    this.brightness = SystemUiOverlayStyle.dark,
    this.titleTextSize = 17,
    this.appBarHeight,
    this.bottom = false,
    this.bottomsize = kToolbarHeight,
    this.bottomtitle,
    this.subtitle,
    this.flexibleSpace,
  }) : super(key: key);
  final bool showBack;
  final bool showLeading;
  final bool centerTitle;
  final String title;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final double? appBarHeight;
  final bool bottom;
  final double bottomsize;
  final ValueNotifier<String>? listenableTitle;
  final SystemUiOverlayStyle brightness;
  final double titleTextSize;
  final String? bottomtitle;
  final String? subtitle;
  final Widget? flexibleSpace;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: bottom
            ? AppBar(
                systemOverlayStyle: brightness,
                toolbarHeight: appBarHeight,
                elevation: 0,
                flexibleSpace: flexibleSpace,
                title: listenableTitle != null
                    ? ValueListenableBuilder(
                        valueListenable: listenableTitle!,
                        builder: (context, value, child) {
                          return Text(
                            value,
                            textAlign: centerTitle
                                ? TextAlign.center
                                : TextAlign.start,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff131921),
                            ),
                          );
                        },
                      )
                    : titleWidget ??
                        Text(
                          title,
                          textAlign:
                              centerTitle ? TextAlign.center : TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.41,
                            height: 22 / titleTextSize,
                          ),
                        ),
                centerTitle: centerTitle,
                actions: actions ?? [],
                backgroundColor: Colors.transparent,
                leadingWidth: showBack
                    ? 56
                    : leading == null
                        ? 0
                        : 80,
                leading: showBack && !showLeading
                    ? AppIconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icons.arrow_back_ios,
                      )
                    : leading ?? const SizedBox(),
                bottom: PreferredSize(
                  preferredSize: preferredSize,
                  child: ListTile(
                    title: Text(
                      bottomtitle!,
                      style: AppTextStyle.noCardsOpacity,
                    ),
                    subtitle: Text(
                      subtitle!,
                      style: AppTextStyle.defaultWhiteOpacity,
                    ),
                  ),
                ),
              )
            : AppBar(
                systemOverlayStyle: brightness,
                toolbarHeight: appBarHeight,
                elevation: 0,
                flexibleSpace: flexibleSpace,
                title: listenableTitle != null
                    ? ValueListenableBuilder(
                        valueListenable: listenableTitle!,
                        builder: (context, value, child) {
                          return Text(
                            value,
                            textAlign: centerTitle
                                ? TextAlign.center
                                : TextAlign.start,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff131921),
                            ),
                          );
                        },
                      )
                    : titleWidget ??
                        Text(
                          title,
                          textAlign:
                              centerTitle ? TextAlign.center : TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.41,
                            height: 22 / titleTextSize,
                          ),
                        ),
                centerTitle: centerTitle,
                actions: actions ?? [],
                backgroundColor: backgroundColor,
                leadingWidth: showBack
                    ? 78
                    : leading == null
                        ? 0
                        : 80,
                leading: showBack && !showLeading
                    ? AppIconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icons.arrow_back_ios_new_rounded,
                        color: backgroundColor != AppColors.mainBlue
                            ? (backgroundColor ?? AppColors.mainBlue)
                                .withBlue(120)
                            : AppColors.mainBlue,
                      )
                    : leading,
              ),
      ),
    );
  }

  @override
  Size get preferredSize => bottom
      ? Size.fromHeight(bottomsize)
      : const Size.fromHeight(kToolbarHeight);
}
