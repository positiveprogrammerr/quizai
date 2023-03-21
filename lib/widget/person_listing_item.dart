import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_text_style.dart';

class PersonListingItem extends StatelessWidget {
  final String image;
  final String blueLabel;
  final Widget? subtitle;
  const PersonListingItem({
    super.key,
    required this.image,
    required this.blueLabel,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          minLeadingWidth: 0,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
          title: const Text(
            "Kyle Hawkins",
            style: AppTextStyle.darkTitle,
          ),
          subtitle: subtitle,
          trailing: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.cyan.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              blueLabel,
              style:
                  AppTextStyle.defaultBoldWhite.copyWith(color: AppColors.cyan),
            ),
          ),
        ),
      ),
    );
  }
}
