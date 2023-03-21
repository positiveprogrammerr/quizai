import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizai/page/create_quiz/create_quiz_steps_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_formated_body.dart';
import 'package:quizai/widget/app_icon_button.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_text_field.dart';
import 'package:quizai/widget/app_text_style.dart';
import 'package:quizai/widget/buttons.dart';

const List<String> list1 = <String>[
  'Multiple Choice Question (4 Option)',
  'Multiple Choice Question (6 Option)',
  'Question (4 Option)',
];
const List<String> list2 = <String>['5 Minutes', '10 Minutes', '20 Minutes', '40 Minutes'];

class CreateQuizPage extends StatefulWidget {
  const CreateQuizPage({super.key});

  @override
  State<CreateQuizPage> createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      withBackButton: true,
      appBarTitle: "Create Quiz",
      body: AppFormatedBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Quiz ID:",
                  style: AppTextStyle.darkTitle,
                ),
                const Text(
                  "458 522 5569",
                  style: AppTextStyle.subTitleGrey,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                  decoration: BoxDecoration(
                      color: AppColors.cyan.withOpacity(.3),
                      borderRadius: BorderRadius.circular(6)),
                  child: const Icon(
                    CupertinoIcons.pencil,
                    color: AppColors.cyan,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Quiz Password:",
                  style: AppTextStyle.darkTitle,
                ),
                Text(
                  "2C4mm1",
                  style: AppTextStyle.subTitleGrey,
                ),
                SizedBox.shrink(),
                SizedBox.shrink(),
              ],
            ),
            const SizedBox(height: 6),
            const Divider(),
            const SizedBox(height: 12),
            const AppTextFieldWidget(
              labelText: "Quiz Name",
            ),
            const SizedBox(height: 12),
            _buildQuestionDropDownButton("Quiz Type:", list1),
            const SizedBox(height: 12),
            const AppTextFieldWidget(
              labelText: "Number of Question",
            ),
            const SizedBox(height: 12),
            _buildQuestionDropDownButton("Quiz Duration:", list2),
            const Spacer(),
            AppPrimaryButton(
              label: "Continue",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateQuizStepsPage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionDropDownButton(String label, List<String> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.defaultBoldDark,
        ),
        const SizedBox(height: 8),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: AppColors.darkPrimary.withOpacity(.03),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.3, color: AppColors.darkPrimary)),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: list.first,
                  elevation: 1,
                  icon: Container(),
                  borderRadius: BorderRadius.circular(8),
                  alignment: Alignment.center,
                  style: const TextStyle(color: AppColors.darkPrimary),
                  onChanged: (String? value) {
                    // setState(() {
                    //   list[0] = value!;
                    // });
                  },
                  underline: Container(),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: AppColors.darkPrimary,
              )
            ],
          ),
        ),
      ],
    );
  }
}
