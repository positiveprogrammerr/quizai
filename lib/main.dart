import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quizai/page/onboarding/onboarding_screen.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizai',
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
      theme: ThemeData(
        listTileTheme: ListTileThemeData(iconColor: Colors.white),
        primaryColor: AppColors.mainBlue,
        iconTheme: const IconThemeData(color: AppColors.mainBlue),
      ),
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          GestureDetector(
            child: LoaderOverlay(
              disableBackButton: true,
              overlayWidget: const Center(
                child: SpinKitThreeBounce(
                  color: AppColors.primaryColor,
                ),
              ),
              child: FlutterEasyLoading(child: child),
            ),
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
          maxWidth: 2000,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(400, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(
            color: Colors.white,
          ),
        );
      },
      //getPages: pages,
    );
  }
}
