import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:quizai/page/create_quiz/create_quiz_screen.dart';
import 'package:quizai/page/history/history_screen.dart';
import 'package:quizai/page/home/home_screen.dart';
import 'package:quizai/page/leaderboard/detail_leaderboard_screen.dart';
import 'package:quizai/page/leaderboard/leaderboard_screen.dart';
import 'package:quizai/page/profile/profile_screen.dart';
import 'package:quizai/page/refer_a_friend/refer_a_friend_screen.dart';
import 'package:quizai/page/setting/setting_screen.dart';
import 'package:quizai/page/sign_in/sign_in_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_shadow.dart';
import 'package:quizai/widget/app_text_style.dart';

AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: AppColors.darkPrimary,
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 400),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      openRatio: 0.6,
      childDecoration: BoxDecoration(
        boxShadow: [AppShadow.glassEffect],
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white38,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        tabIndex = 3;
                        advancedDrawerController.hideDrawer();
                      });
                    },
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.black26,
                          backgroundImage:
                              NetworkImage("https://picsum.photos/200"),
                          radius: 28,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Shaharuzzaman",
                          style: AppTextStyle.whiteTitle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 36,
                color: Colors.white24,
              ),
              _drawerListingItem(Icons.home_rounded, "Home", index: 0),
              _drawerListingItem(Icons.history, "History", index: 1),
              _drawerListingItem(Icons.leaderboard, "Leaderboard", index: 2),
              _drawerListingItem(Icons.people, "Friend List",
                  page: const DetailLeaderboardPage("Local")),
              _drawerListingItem(
                CupertinoIcons.link,
                "Refer a Friend",
                page: const ReferAFriendPage(),
              ),
              _drawerListingItem(Icons.settings, "Setting",
                  page: const SettingPage()),
              const Spacer(),
              const Divider(
                height: 36,
                color: Colors.white24,
              ),
              CupertinoButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                    (route) => false),
                child: Row(
                  children: const [
                    Icon(
                      Icons.power_settings_new_rounded,
                      color: Colors.white38,
                      size: 30,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Log Out",
                      style: AppTextStyle.whiteTitle,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        body: IndexedStack(
          index: tabIndex,
          children: _buildScreens(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateQuizPage()),
            );
          },
          backgroundColor: AppColors.mainBlue,
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AppColors.mainBlue,
          shape: const CircularNotchedRectangle(), //shape of notch
          notchMargin: 6,
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _navbars(tabIndex),
          ),
        ),
      ),
    );
  }

  Widget _drawerListingItem(
    IconData icon,
    String label, {
    Widget? page,
    int? index,
  }) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () => page != null
          ? Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            )
          : index != null
              ? setState(() {
                  tabIndex = index;
                  advancedDrawerController.hideDrawer();
                })
              : null,
      child: ListTile(
        minLeadingWidth: 0,
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          label,
          style: AppTextStyle.whiteTitle,
        ),
      ),
    );
  }

  List<Widget> _navbars(int index) {
    return [
      _bottomNavBarItem(Icons.home_rounded, isActive: index == 0, index: 0),
      _bottomNavBarItem(Icons.history, isActive: index == 1, index: 1),
      const SizedBox.shrink(),
      const SizedBox.shrink(),
      _bottomNavBarItem(Icons.leaderboard_rounded,
          isActive: index == 2, index: 2),
      _bottomNavBarItem(CupertinoIcons.person_fill,
          isActive: index == 3, index: 3),
    ];
  }

  Widget _bottomNavBarItem(IconData icon,
      {required bool isActive, required int index}) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      child: Icon(
        icon,
        color: isActive ? Colors.white : Colors.white38,
        size: 26,
      ),
      onPressed: () {
        setState(() {
          tabIndex = index;
        });
      },
    );
  }

  List<Widget> _buildScreens() {
    return const [
      HomePage(),
      HistoryPage(),
      LeaderboardPage(),
      ProfilePage(),
    ];
  }
}
