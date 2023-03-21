import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizai/page/dashboard/dashboard_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_text_field.dart';
import 'package:quizai/widget/app_text_style.dart';
import 'package:quizai/widget/auth_app_bar.dart';
import 'package:quizai/widget/buttons.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          AuthAppBar(
            title: "Forgot Password",
            subtitle: Text(
              "Forgot your password? Don't worry",
              style: AppTextStyle.textFieldStyle.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const AppTextFieldWidget(
                  labelText: "Email",
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    color: AppColors.greySecondary,
                  ),
                ),
                const SizedBox(height: 30),
                AppPrimaryButton(
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardPage(),
                    ),
                    (route) => false,
                  ),
                  label: "Recover Password",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
