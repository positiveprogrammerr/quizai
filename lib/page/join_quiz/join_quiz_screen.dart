import 'package:flutter/material.dart';
import 'package:quizai/page/join_quiz/quiz_found_screen.dart';
import 'package:quizai/widget/app_formated_body.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_text_field.dart';
import 'package:quizai/widget/buttons.dart';

class JoinQuizPage extends StatelessWidget {
  const JoinQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Join Quiz",
      body: AppFormatedBody(
        child: Column(
          children: [
            const AppTextFieldWidget(
              labelText: "Quiz ID",
            ),
            const SizedBox(height: 16),
            const AppTextFieldWidget(
              labelText: "Quiz Password",
            ),
            const Spacer(),
            AppPrimaryButton(
              label: "Next",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QuizFoundPage()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
