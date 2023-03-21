import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizai/utils/assets_manager.dart';
import 'package:quizai/widget/app_shadow.dart';
import 'package:quizai/widget/app_text_style.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  }) : super(key: key);
  final String icon;
  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1.2,
        ),
        boxShadow: [
          AppShadow.glassEffect,
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        child: ListTile(
          onTap: onTap,
          leading: SvgPicture.asset(
            Assets.icon(icon),
            height: 30,
          ),
          title: Text(
            label,
            style: AppTextStyle.whiteTitle,
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
