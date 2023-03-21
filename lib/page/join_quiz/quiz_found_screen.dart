import 'package:flutter/material.dart';
import 'package:quizai/page/join_quiz/quiz_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_formated_body.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_text_style.dart';
import 'package:quizai/widget/buttons.dart';

class QuizFoundPage extends StatelessWidget {
  const QuizFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Join Quiz",
      body: AppFormatedBody(
        child: Column(
          children: [
            const Text(
              "Quiz Found!",
              style: AppTextStyle.boldDark,
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.mainBlue.withOpacity(.2),
              ),
              child: const Text(
                "Collage Quiz 2021",
                style: AppTextStyle.defaultBoldBlue,
              ),
            ),
            const SizedBox(height: 26),
            _buildQuizTile(
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://media.vanityfair.com/photos/6319eab06009e759e6638e28/master/w_2560%2Cc_limit/1421315651",
                  ),
                ),
                title: Text(
                  "Shaharuzzaman",
                  style: AppTextStyle.darkTitle,
                ),
              ),
              "Create By",
            ),
            const SizedBox(height: 16),
            _buildQuizTile(
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildAboutTitle("Quiz Type:", "MCQ"),
                    const SizedBox(height: 18),
                    _buildAboutTitle("Number of Question:", "15"),
                    const SizedBox(height: 18),
                    _buildAboutTitle("Quiz Duration:", "10 Minutes"),
                  ],
                ),
              ),
              "About This Quiz",
            ),
            const Spacer(),
            AppPrimaryButton(
              label: "Start Quiz",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QuizPage()),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAboutTitle(String title, String secondaryTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.darkTitle,
        ),
        Text(
          secondaryTitle,
          style: AppTextStyle.subTitleGrey,
        ),
      ],
    );
  }

  Widget _buildQuizTile(Widget child, String title) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: AppTextStyle.dialogStyle.copyWith(
              color: AppColors.greySecondary,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.grey.withOpacity(0.2),
          ),
          child: child,
        ),
      ],
    );
  }
}
