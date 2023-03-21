import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizai/page/create_quiz/create_quiz_finished_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_formated_body.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_text_field.dart';
import 'package:quizai/widget/app_text_style.dart';
import 'package:quizai/widget/buttons.dart';

class CreateQuizStepsPage extends StatefulWidget {
  const CreateQuizStepsPage({super.key});

  @override
  State<CreateQuizStepsPage> createState() => _CreateQuizStepsPageState();
}

class _CreateQuizStepsPageState extends State<CreateQuizStepsPage> {
  int questionIndex = 5;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      withBackButton: true,
      appBarTitle: "Create Quiz",
      body: AppFormatedBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question $questionIndex",
              style: AppTextStyle.boldDark,
            ),
            const SizedBox(height: 12),
            FittedBox(
              child: Row(
                children: List.generate(
                  15,
                  (index) => Container(
                    height: 5,
                    width: 24,
                    color: index < questionIndex
                        ? AppColors.mainBlue
                        : AppColors.mainBlue.withOpacity(.3),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const AppTextFieldWidget(
              labelText: "Quiz Question",
            ),
            const SizedBox(height: 32),
            const Text(
              "Quiz Answers",
              style: AppTextStyle.subHeadline,
            ),
            const SizedBox(height: 8),
            _buildAnswers("Answer One"),
            const SizedBox(height: 12),
            _buildAnswers("Answer Two"),
            const SizedBox(height: 12),
            _buildAnswers("Answer Three"),
            const SizedBox(height: 12),
            _buildAnswers("Answer Four"),
            const Spacer(),
            AppPrimaryButton(
              label: questionIndex == 15 ? "Finish" : "Continue",
              onTap: () {
                if (questionIndex == 15) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateQuizFinishedPage(),
                    ),
                  );
                }
                setState(() {
                  questionIndex = 15;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAnswers(
    String title,
  ) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {},
      child: AppTextFieldWidget(
        enabled: false,
        hintText: title,
      ),
    );
  }
}
