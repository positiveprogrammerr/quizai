import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizai/page/dashboard/dashboard_screen.dart';
import 'package:quizai/page/home/home_screen.dart';
import 'package:quizai/page/onboarding/onboarding_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_icon_button.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_text_style.dart';
import 'package:quizai/widget/buttons.dart';

class CreateQuizFinishedPage extends StatelessWidget {
  const CreateQuizFinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "",
      withBackButton: false,
      backgroundColor: AppColors.mainBlue,
      leading: const SizedBox.shrink(),
      trailingAppBar: AppIconButton(
        padding: const EdgeInsets.only(right: 32),
        icon: CupertinoIcons.xmark,
        onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardPage(),
            ),
            (route) => false),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.bgColorWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 110),
                    SizedBox(
                      height: 112,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 90,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: AppColors.mainBlue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: const Text(
                                "Collage Quiz 2021",
                                style: AppTextStyle.todayStyle,
                              ),
                            ),
                          ),
                          Container(
                            height: 54,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 28),
                            decoration: BoxDecoration(
                              color: AppColors.cyan,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text("Quiz Name",
                                style: AppTextStyle.mainTitle),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildTitle("Quiz ID", "458 522 5569"),
                    _buildTitle("Password", "2C4mm1"),
                    _buildTitle("Invite Link", "quiz.com/fkq-hqxd-gqz"),
                    const SizedBox(height: 24),
                    AppPrimaryButton(
                      onTap: () {},
                      color: AppColors.cyan,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      label: "Challange Friends",
                    ),
                    const SizedBox(height: 12),
                    AppPrimaryButton(
                      onTap: () {},
                      color: const Color.fromARGB(255, 50, 109, 218),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      label: "Share Link",
                    ),
                  ],
                ),
              ),
              Container(
                height: 17,
                margin: const EdgeInsets.symmetric(horizontal: 42),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.6),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(32),
                  ),
                ),
              ),
              Container(
                height: 17,
                margin: const EdgeInsets.symmetric(horizontal: 62),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.3),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(32),
                  ),
                ),
              ),
              const SafeArea(child: SizedBox(height: 32)),
            ],
          ),
          Column(
            children: [
              SafeArea(
                bottom: false,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  CupertinoIcons.hand_thumbsup_fill,
                  size: MediaQuery.of(context).size.height * 0.19,
                  color: AppColors.cyan,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title, String subtitle) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.darkTitle,
            ),
            Text(
              subtitle,
              style: AppTextStyle.subTitleGrey,
            ),
            const SizedBox.shrink(),
            const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(),
      ],
    );
  }
}
