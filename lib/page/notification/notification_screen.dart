import 'package:flutter/material.dart';
import 'package:quizai/widget/app_formated_body.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/person_listing_item.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Notification",
      body: AppFormatedBody(
        isInfinity: true,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return PersonListingItem(
              image: "https://picsum.photos/200/${300 + index}",
              blueLabel: "Accept",
              subtitle: const Text("Scored 55 in Marketing Strategy Module Part - ||"),
            );
          },
        ),
      ),
    );
  }
}
