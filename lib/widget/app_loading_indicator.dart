import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    Key? key,
    required this.child,
    required this.loading,
  }) : super(key: key);
  final Widget child;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loading
          ? const Center(
              child: CupertinoActivityIndicator(
                color: Colors.white,
                radius: 18,
              ),
            )
          : child,
    );
  }
}
