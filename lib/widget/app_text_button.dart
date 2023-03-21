import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizai/widget/app_text_style.dart';

import '../style/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.loading,
  }) : super(key: key);
  final String label;
  final VoidCallback onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loading
          ? const CupertinoActivityIndicator(
            color: AppColors.secondaryColor,
            radius: 14,
          )
          : TextButton(
              onPressed: onTap,
              child: Text(
                label,
                style: AppTextStyle.whiteTitle,
              )),
    );
  }
}
