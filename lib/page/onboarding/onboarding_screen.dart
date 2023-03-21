import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizai/page/sign_up/sign_up_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/utils/assets_manager.dart';
import 'package:quizai/widget/app_shadow.dart';
import 'package:quizai/widget/app_text_style.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  final PageController pageController = PageController();
  final List<Map<String, String>> dataTitles = [
    {
      "title": "Create your own game",
      "subtitle":
          "Set ut perspicatis unde omnis iste natus error sit valuptatem accusantuium doloremque laudantium",
    },
    {
      "title": "Challange Your Firends",
      "subtitle":
          "Quizai's mission to deliver high-quality questions in every topic you can imagine. Make your quiz and challenge your firends instantly.",
    },
    {
      "title": "Watch Leaderboard",
      "subtitle":
          "our leaderboard, allow you to measure your progress and see how you stack up against players from all around the world.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: AppColors.bgColorWhite,
            ),
            Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(72),
                    ),
                    child: PageView.builder(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) => Image.asset(
                        Assets.image("onboarding_step${index + 1}",
                            format: ".png"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: pageController,
                            itemCount: dataTitles.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => _buildTitles(
                              dataTitles[index]['title'] ?? "",
                              dataTitles[index]['subtitle'] ?? "",
                            ),
                          ),
                        ),
                        _buildCurrenter(currentIndex),
                        const SizedBox(height: 28),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CupertinoButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                                (route) => false,
                              ),
                              child: const Text(
                                "Skip",
                                style: AppTextStyle.subTitleGrey,
                              ),
                            ),
                            CupertinoButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                if (currentIndex < 2) {
                                  pageController.animateTo(
                                    (context.size?.width ?? 0) *
                                        (currentIndex + 1),
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutQuad,
                                  );
                                  currentIndex++;
                                  setState(() {});
                                  return;
                                }
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.secondaryColor,
                                    boxShadow: [AppShadow.glassEffect]),
                                child: currentIndex == 2
                                    ? const Text(
                                        "Get Started",
                                        style: AppTextStyle.mainWhiteStyle,
                                      )
                                    : const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColors.white,
                                        size: 26,
                                      ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SafeArea(
                  top: false,
                  child: SizedBox.shrink(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitles(String title, String subTitle) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.mainDarkTitle,
        ),
        const SizedBox(height: 28),
        Text(
          subTitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCurrenter(int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          height: 5,
          width: 25,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: index == currentIndex
                ? AppColors.secondaryColor
                : AppColors.secondaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(16),
          ),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutQuart,
        ),
      ),
    );
  }
}
