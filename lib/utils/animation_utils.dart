import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationUtils {
  static double flexOpacity(double value) {
    if (value > 1.0) return 1.0;
    if (value < 0.0) return 0.0;
    return value;
  }
}

showSideSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool rightSide = true,
}) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 300),
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: (rightSide ? Alignment.centerRight : Alignment.centerLeft),
        child: Container(
          height: double.infinity,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: builder.call(context),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position:
            Tween(begin: Offset((rightSide ? 1 : -1), 0), end: const Offset(0, 0))
                .animate(animation1),
        child: child,
      );
    },
  );
}
