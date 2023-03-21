import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_text_style.dart';

import 'app_text.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    Key? key,
    required this.onTap,
    this.label,
    this.loading = false,
    this.color = AppColors.mainBlue,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);
  final VoidCallback onTap;
  final String? label;
  final bool loading;
  final Color color;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return _AnimatedButton(
      pressEvent: loading ? null : onTap,
      text: label,
      buttonTextStyle: AppTextStyle.mainWhiteStyle,
      borderRadius: BorderRadius.circular(15),
      color: color,
      height: 60,
      loading: loading,
      padding: padding,
    );
  }
}

class _AnimatedButton extends StatefulWidget {
  final Function? pressEvent;
  final String? text;
  final double width;
  final double? height;
  final bool isFixedHeight;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? buttonTextStyle;
  final bool loading;
  final EdgeInsets padding;

  const _AnimatedButton({
    required this.pressEvent,
    this.text,
    this.color,
    this.height,
    this.isFixedHeight = true,
    this.width = double.infinity,
    this.borderRadius,
    this.padding = const EdgeInsets.all(0),
    this.buttonTextStyle,
    this.loading = false,
  });

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton>
    with SingleTickerProviderStateMixin {
  static const int _forwardDurationNumber = 150;
  late AnimationController _animationController;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _forwardDurationNumber),
      reverseDuration: const Duration(milliseconds: 100),
    )..addStatusListener(
        _animationStatusListener,
      );
    _scale = Tween<double>(
      begin: 1,
      end: 0.9,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeIn,
      ),
    );
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() async {
    _animationController.forward();
    //Delayed added in purpose to keep same animation behavior as previous version when dialog was closed while animation was still playing
    await Future.delayed(
      const Duration(milliseconds: _forwardDurationNumber ~/ 2),
    );
    widget.pressEvent?.call();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: _animatedButtonUI,
    );
  }

  Widget get _animatedButtonUI => Container(
        width: widget.width,
        height: widget.isFixedHeight ? 50 : widget.height,
        padding: widget.padding,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: widget.color,
              shadowColor: widget.color,
              shape: RoundedRectangleBorder(
                borderRadius: widget.borderRadius ??
                    const BorderRadius.all(
                      Radius.circular(15),
                    ),
              )),
          onPressed: _onTap,
          child: Stack(
            children: [
              widget.loading
                  ? const CupertinoActivityIndicator(
                      color: AppColors.white,
                      radius: 14,
                    )
                  : Align(
                      child: AppText(
                        '${widget.text}',
                        textAlign: TextAlign.center,
                        style: widget.buttonTextStyle ??
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                    ),
            ],
          ),
        ),
      );
}
