import 'package:flutter/material.dart';
import 'package:quizai/style/app_colors.dart';

class AppBorder {
  static Border defaultBottomBorder = Border(
    bottom: BorderSide(color: AppColors.white.withOpacity(0.3)),
  );
  static Border defaultTopBorder = Border(
    top: BorderSide(color: AppColors.white.withOpacity(0.3)),
  );
  static Border defaultBorder = Border.all(
    color: AppColors.white.withOpacity(0.3),
  );
}
