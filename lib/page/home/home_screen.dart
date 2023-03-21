import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizai/page/create_quiz/create_quiz_screen.dart';
import 'package:quizai/page/join_quiz/join_quiz_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_icon_button.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_shadow.dart';
import 'package:quizai/widget/app_text_style.dart';
import 'package:quizai/widget/categories_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "",
      mainPages: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "Welcome Back!",
              style: AppTextStyle.calendarStyle,
            ),
            Text(
              "Shaharuzzaman",
              style: AppTextStyle.boldWhiteSubTitle,
            ),
          ],
        ),
        titlePadding: const EdgeInsets.all(16),
      ),
      height: true,
      withBackButton: false,
      bottomSize: 154,
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          Container(
            height: 68,
            decoration: const BoxDecoration(
              color: AppColors.mainBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 10),
                  children: [
                    _buildColoredCard([
                      AppColors.orange,
                      Colors.red,
                      Colors.redAccent.shade400,
                    ], "Create", "Quiz", const CreateQuizPage(), context),
                    _buildColoredCard([
                      AppColors.cyan,
                      Colors.blueAccent.shade700,
                      AppColors.mainBlue,
                    ], "Join in", "Quiz", const JoinQuizPage(), context),
                    _buildColoredCard([
                      Colors.greenAccent,
                      Colors.green.shade400,
                      AppColors.green,
                    ], "Challenge", "Friends"),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Choose Categories",
                      style: AppTextStyle.boldDark,
                    ),
                    Text(
                      "See All",
                      style: AppTextStyle.defaultBoldWhite
                          .copyWith(color: AppColors.cyan),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CategoriesWidget(
                      "Science",
                      Icons.rocket,
                      Colors.redAccent,
                    ),
                    const CategoriesWidget(
                      "Geography",
                      CupertinoIcons.globe,
                      AppColors.mainBlue,
                    ),
                    CategoriesWidget(
                      "Sports",
                      Icons.sports_football,
                      Colors.purpleAccent.shade200,
                    ),
                    const CategoriesWidget(
                      "Biology",
                      CupertinoIcons.tree,
                      AppColors.green,
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColoredCard(List<Color> colors, String title, String subtitle,
      [Widget? screen, BuildContext? context]) {
    return GestureDetector(
      onTap: () {
        if (screen != null && context != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
      child: Container(
        width: 168,
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            FittedBox(
              child: Text(
                title,
                style: AppTextStyle.calendarStyle,
              ),
            ),
            FittedBox(
              child: Text(
                subtitle,
                style: AppTextStyle.boldWhiteTitle,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white60,
              ),
              child: Icon(
                Icons.arrow_forward,
                color: colors.last,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
