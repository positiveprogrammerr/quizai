import 'package:flutter/cupertino.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_shadow.dart';
import 'package:quizai/widget/app_text_style.dart';

class AuthAppBar extends StatelessWidget {
  final String title;
  final Widget subtitle;
  const AuthAppBar({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          decoration: const BoxDecoration(
            color: AppColors.mainBlue,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SafeArea(bottom: false, child: SizedBox.shrink()),
              Row(
                children: [
                  Text(
                    "Qui",
                    style: AppTextStyle.biggestWhiteTitle.copyWith(
                        color: AppColors.primaryColor,
                        shadows: [AppShadow.textEffect]),
                  ),
                  Text(
                    "zai",
                    style: AppTextStyle.biggestWhiteTitle.copyWith(
                      color: const Color.fromARGB(255, 218, 251, 255),
                      shadows: [AppShadow.textEffect],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                title, //"Register New Account",
                style: AppTextStyle.mainTitle,
              ),
              const SizedBox(height: 8),
              subtitle,
              const SizedBox(height: 20),
            ],
          ),
        ),
        Container(
          height: 17,
          margin: const EdgeInsets.symmetric(horizontal: 28),
          decoration: BoxDecoration(
            color: AppColors.mainBlue.withOpacity(0.9),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
          ),
        ),
        Container(
          height: 17,
          margin: const EdgeInsets.symmetric(horizontal: 58),
          decoration: BoxDecoration(
            color: AppColors.mainBlue.withOpacity(0.8),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
          ),
        ),
      ],
    );
  }
}
