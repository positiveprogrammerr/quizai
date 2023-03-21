import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_shadow.dart';
import 'package:quizai/widget/app_text_style.dart';

class CategoriesWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const CategoriesWidget(
    this.title,
    this.icon,
    this.color, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                boxShadow: [AppShadow.glassEffect],
                borderRadius: BorderRadius.circular(20),
                color: AppColors.bgColorWhite),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 74,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppTextStyle.todayStyle.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )
      ],
    );
  }
}
