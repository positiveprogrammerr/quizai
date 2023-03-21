import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_formated_body.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_shadow.dart';
import 'package:quizai/widget/app_text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      mainPages: true,
      withBackButton: false,
      appBarTitle: "Profile",
      body: AppFormatedBody(
        child: Column(
          children: [
            _buildProfileAvatar(),
            const SizedBox(height: 24),
            const Text(
              "Shaharuzzaman",
              style: AppTextStyle.mainDarkTitle,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCountOfConnections("35 Followers", AppColors.mainBlue),
                const SizedBox(width: 12),
                _buildCountOfConnections("150 Friends", AppColors.cyan)
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.mainBlue.withOpacity(0.05),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Badge",
                          style: AppTextStyle.darkTitle.copyWith(fontSize: 20),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _badgeIcon(86, Icons.star_border_outlined),
                            _badgeIcon(86, Icons.military_tech),
                            _badgeIcon(86, Icons.check),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.mainBlue.withOpacity(0.05),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRankAndScoreBanner(
                            CupertinoIcons.globe, "World Rank", "7,373,025"),
                        const SizedBox(width: 10),
                        _buildRankAndScoreBanner(
                            Icons.circle_outlined, "Local Rank", "1,913"),
                        const SizedBox(width: 30),
                        _buildRankAndScoreBanner(
                            CupertinoIcons.star_circle_fill, "Score", "5,400"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankAndScoreBanner(IconData icon, String title, String count) {
    return Column(
      children: [
        Icon(
          icon,
          size: 46,
          color: AppColors.yellow,
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: AppTextStyle.defaultBoldDark
              .copyWith(color: const Color.fromARGB(255, 140, 140, 161)),
        ),
        const SizedBox(height: 4),
        Text(
          count,
          style: AppTextStyle.darkTitle,
        ),
      ],
    );
  }

  Widget _buildProfileAvatar() {
    return SizedBox(
      height: 120,
      width: 120,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey,
              boxShadow: [AppShadow.glassEffect],
              image: const DecorationImage(
                image: NetworkImage("https://picsum.photos/200"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _badgeIcon(34, Icons.check),
          ),
        ],
      ),
    );
  }

  Widget _badgeIcon(double size, IconData icon) {
    return Container(
      height: size,
      width: size,
      padding: EdgeInsets.all(size / 10),
      decoration: BoxDecoration(
        color: AppColors.mainBlue,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [AppShadow.glassEffect],
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.yellow,
        child: Icon(
          icon,
          size: size / 2,
          color: AppColors.white,
        ),
      ),
    );
  }

  Widget _buildCountOfConnections(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.45),
            offset: const Offset(0, 0),
            blurRadius: 12,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Text(
        label,
        style: AppTextStyle.secondaryTitleWhite,
      ),
    );
  }
}
