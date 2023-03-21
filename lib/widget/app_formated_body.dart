import 'package:flutter/material.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:get/get.dart';
import 'package:quizai/widget/app_shadow.dart';

class AppFormatedBody extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool isInfinity;
  final double height;
  final bool isCircular;
  const AppFormatedBody({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
    this.isInfinity = false,
    this.isCircular = false,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: AppColors.mainBlue,
              borderRadius: isCircular
                  ? const BorderRadius.vertical(
                      bottom: Radius.circular(14),
                    )
                  : null,
            ),
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Container(
                margin: isInfinity
                    ? const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      )
                    : const EdgeInsets.all(16),
                padding: padding,
                width: context.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [AppShadow.glassEffect],
                ),
                child: child,
              ),
            ),
            isInfinity
                ? const SizedBox.shrink()
                : const SafeArea(
                    top: false,
                    child: SizedBox.shrink(),
                  ),
          ],
        )
      ],
    );
  }
}
// YORIM MANI BAXTIM ILTMOS SEVGILIM
// QANAQADR JOYGA 