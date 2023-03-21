import 'package:flutter/cupertino.dart';
import 'package:quizai/style/app_colors.dart';

class AppShadow {
  static final BoxShadow glassEffect = BoxShadow(
    color: AppColors.darkPrimary.withOpacity(.07),
    offset: const Offset(0, 12),
    blurRadius: 96,
    spreadRadius: 0,
  );
  static final BoxShadow textEffect = BoxShadow(
    color: AppColors.darkPrimary.withOpacity(0.45),
    offset: const Offset(8, 8),
    blurRadius: 78,
    spreadRadius: 0.0,
  );
  static final BoxShadow buttonEffect = BoxShadow(
    color: AppColors.darkPrimary.withOpacity(0.3),
    offset: const Offset(2, 2),
    blurRadius: 2,
    spreadRadius: 0.8,
  );
}
