import 'package:flutter/material.dart';

import '../widget/hexcolor.dart';

abstract class AppColors {
  AppColors._();
  static const Color white = Color.fromARGB(255, 248, 248, 248);
  static const Color primaryColor = Color.fromARGB(255, 0, 229, 255);
  static const Color secondaryColor = Color(0xFF3248DA);
  static const Color bgColorWhite = Color(0xFFFBFBFC);
  static const Color grey = Color(0xFFD4D3E0);
  static const Color greySecondary = Color(0xFF6E6E84);
  static const Color glass = Color(0xFF282878);
  static const Color darkPrimary = Color(0xFF0D1761);
  static const Color mainBlue = Color(0xFF3248DA);
  static const Color cyan = Color(0xFF00CAF2);
  static const Color orange = Color(0xFFFF7040);
  static const Color yellow = Color.fromARGB(255, 255, 191, 0);
  static const Color green = Color(0xFF47CC49);
  static const Color error = Color(0xFFFF5D54);
  static const Color shadow = Color(0xFF0A0A46);
}
