import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_formated_body.dart';
import 'package:quizai/widget/app_scaffold.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      mainPages: true,
      withBackButton: false,
      appBarTitle: "History",
      body: AppFormatedBody(
        isInfinity: true,
        child: Column(
          children: [
            _buildCardHistoryItem(Colors.purpleAccent, "Marketing Strategy"),
            const SizedBox(height: 12),
            _buildCardHistoryItem(Colors.greenAccent, "Chemical Reaction"),
            const SizedBox(height: 12),
            _buildCardHistoryItem(Colors.orangeAccent, "Electronics Circuit"),
            const SizedBox(height: 12),
            _buildCardHistoryItem(Colors.purpleAccent, "Radio Technology"),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHistoryItem(Color color, String title) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        minLeadingWidth: 0,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12)),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: color,
          ),
        ),
        title: Text(title),
        subtitle: const Text("12 Friends Participate in This Quiz"),
      ),
    );
  }
}
