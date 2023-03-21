import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_formated_body.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_shadow.dart';
import 'package:quizai/widget/app_text_style.dart';
import 'package:quizai/widget/person_listing_item.dart';

class DetailLeaderboardPage extends StatelessWidget {
  final String leaderboard;
  const DetailLeaderboardPage(this.leaderboard, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Select $leaderboard",
      body: AppFormatedBody(
        isInfinity: true,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return PersonListingItem(
                    blueLabel: "Challenge",
                    image: "https://picsum.photos/200/${300 + index}",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
