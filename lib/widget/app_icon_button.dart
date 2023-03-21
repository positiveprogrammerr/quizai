import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_shadow.dart';

class AppIconButton extends StatelessWidget {
  final EdgeInsets padding;
  final GestureTapCallback onPressed;
  final IconData icon;
  final Color color;
  const AppIconButton({
    super.key,
    this.padding = const EdgeInsets.all(0),
    required this.onPressed,
    required this.icon,
    this.color = AppColors.mainBlue,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [AppShadow.buttonEffect],
        ),
        child: Icon(
          icon,
          color: AppColors.white,
        ),
      ),
    );
  }
}
