import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizai/page/create_quiz/create_quiz_finished_screen.dart';
import 'package:quizai/page/dashboard/dashboard_screen.dart';
import 'package:quizai/page/join_quiz/quiz_finished_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_formated_body.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_text_field.dart';
import 'package:quizai/widget/app_text_style.dart';
import 'package:quizai/widget/buttons.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _CreateQuizStepsPageState();
}

class _CreateQuizStepsPageState extends State<QuizPage> {
  int questionIndex = 5;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      withBackButton: false,
      leading: const SizedBox.shrink(),
      appBarTitle: "Question $questionIndex",
      body: AppFormatedBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            FittedBox(
              child: Row(
                children: List.generate(
                  15,
                  (index) => Container(
                    height: 5,
                    width: 24,
                    color: index < questionIndex
                        ? index == 3
                            ? AppColors.error
                            : AppColors.green
                        : AppColors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            const Text(
              "The information to be communicated in data communication system is known as",
              style: AppTextStyle.darkTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 46),
            _buildAnswers("Medium"),
            const SizedBox(height: 12),
            _buildAnswers("Transmission"),
            const SizedBox(height: 12),
            _buildAnswers("Message"),
            const SizedBox(height: 12),
            _buildAnswers("Protocol"),
            const SizedBox(height: 20),
            AppPrimaryButton(
              label: questionIndex == 15 ? "Finish" : "Continue",
              onTap: () {
                if (questionIndex == 15) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizFinishedPage(),
                    ),
                  );
                }
                setState(() {
                  questionIndex = 15;
                });
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(),
                ),
                (route) => false,
              ),
              style: TextButton.styleFrom(
                  backgroundColor: AppColors.mainBlue.withOpacity(.2),
                  foregroundColor: AppColors.mainBlue),
              child: const Text("Exit"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswers(
    String title,
  ) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 6),
      onPressed: () {},
      child: AppTextFieldWidget(
        enabled: false,
        hintText: title,
      ),
    );
  }
}
