import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizai/page/dashboard/dashboard_screen.dart';
import 'package:quizai/page/forgot_password/forgot_password_screen.dart';
import 'package:quizai/page/home/home_screen.dart';
import 'package:quizai/page/sign_up/sign_up_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_scaffold.dart';
import 'package:quizai/widget/app_text_field.dart';
import 'package:quizai/widget/app_text_style.dart';
import 'package:quizai/widget/auth_app_bar.dart';
import 'package:quizai/widget/buttons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthAppBar(
              title: "Sign In",
              subtitle: Row(
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextStyle.textFieldStyle.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    ),
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Sign In",
                      style: AppTextStyle.textFieldStyle.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
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
                  const SizedBox(height: 18),
                  const AppTextFieldWidget(
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.lock_open_rounded,
                      color: AppColors.greySecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(
                        value: isActive,
                        onChanged: (v) {
                          setState(() {
                            isActive = v ?? false;
                          });
                        },
                        activeColor: AppColors.mainBlue,
                        side: const BorderSide(
                          width: .6,
                          color: AppColors.grey,
                        ),
                      ),
                      const Text(
                        "Remember me",
                        style: AppTextStyle.textFieldStyle,
                      ),
                      const Spacer(),
                      CupertinoButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Forgot password?",
                          style: AppTextStyle.textFieldStyle.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
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
                    label: "Sign In",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
