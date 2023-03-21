import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:quizai/page/leaderboard/detail_leaderboard_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_icon_button.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_shadow.dart';
import 'package:quizai/widget/app_text_style.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      height: true,
      withBackButton: false,
      bottomSize: context.height * 0.454,
      extendBodyBehindAppBar: false,
      mainPages: true,
      appBarTitle: "Leaderboard",
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 58, 147, 255),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [AppShadow.buttonEffect],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DetailLeaderboardPage("Local"),
                        ),
                      );
                    },
                    child: const Text(
                      "Local",
                      style: AppTextStyle.whiteTitle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: AppColors.cyan,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "Global",
                      style: AppTextStyle.whiteTitle,
                    ),
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DetailLeaderboardPage("Friends"),
                        ),
                      );
                    },
                    child: const Text(
                      "Friends",
                      style: AppTextStyle.whiteTitle,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildWinnerAvatar(
                    212, 52, AppColors.orange, "5620", "Dutton", context),
                const SizedBox(width: 4),
                _buildWinnerAvatar(272, 74, AppColors.green, "8832",
                    "Liza Carter", context, true),
                const SizedBox(width: 4),
                _buildWinnerAvatar(
                    212, 52, AppColors.cyan, "5230", "Dutton", context),
              ],
            )
          ],
        ),
        titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      body: Column(
        children: [
          Container(
            height: 28,
            decoration: const BoxDecoration(
              color: AppColors.mainBlue,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return _buildLeaderboardListItem(index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLeaderboardListItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [AppShadow.glassEffect]),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "${index + 4}",
            style: AppTextStyle.defaultBlue,
          ),
        ),
        minLeadingWidth: 0,
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Kyle Hawkins",
              style: AppTextStyle.darkTitle,
            ),
          ],
        ),
        trailing: Text(
          "5230",
          style: AppTextStyle.mainStyle.copyWith(color: AppColors.cyan),
        ),
      ),
    );
  }

  Widget _buildWinnerAvatar(
    double height,
    double radius,
    Color color,
    String score,
    String name,
    BuildContext context, [
    bool isMain = false,
  ]) {
    return Expanded(
      child: SizedBox(
        height: context.height * (height / 1000),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: context.height * ((height / 2.3) / 1000),
                      width: radius / 0.8,
                      color: color,
                      alignment: const Alignment(0, 0.8),
                      padding: const EdgeInsets.all(8),
                      child: FittedBox(
                        child: Text(
                          score,
                          style: AppTextStyle.todayStyle
                              .copyWith(fontSize: radius / 2),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundColor: color,
                      radius: radius,
                      child: CircleAvatar(
                        radius: radius - (isMain ? 20 : 5),
                        backgroundImage: NetworkImage(
                            "https://picsum.photos/200/${color == AppColors.orange ? 299 : color == AppColors.cyan ? 300 : 301}"),
                      ),
                    ),
                  ),
                  Align(
                    alignment:
                        isMain ? const Alignment(-1, -0.82) : Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: AppColors.yellow,
                      radius: 20,
                      child: Text(
                        color == AppColors.orange
                            ? "2"
                            : color == AppColors.cyan
                                ? "3"
                                : "1",
                        style: AppTextStyle.mainDarkTitle
                            .copyWith(color: Colors.red.shade700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            FittedBox(
              child: Text(
                name,
                style: AppTextStyle.boldWhite.copyWith(color: AppColors.cyan),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
