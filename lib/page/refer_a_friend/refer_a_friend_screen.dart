import 'package:flutter/cupertino.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_formated_body.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_text_style.dart';

class ReferAFriendPage extends StatelessWidget {
  const ReferAFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Refer a Friend",
      body: AppFormatedBody(
        height: 240,
        isCircular: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cyan.withOpacity(0.2),
                border: Border.all(color: AppColors.cyan, width: 3),
              ),
              child: const Icon(CupertinoIcons.gift, size: 84),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.cyan,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "MghWOP",
                style: AppTextStyle.mainTitle,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Share your code with your friends and get bonus point",
              textAlign: TextAlign.center,
              style: AppTextStyle.subTitleGrey,
            )
          ],
        ),
      ),
    );
  }
}
