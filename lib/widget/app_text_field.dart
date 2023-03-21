import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizai/style/app_colors.dart';
import 'package:quizai/widget/app_shadow.dart';

import 'app_text_style.dart';

class AppTextFieldWidget extends StatelessWidget {
  final bool obscureText;
  final bool autoCorrect;
  final bool hasBorder;
  final bool isLast;
  final double? height;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final int maxLines;
  final int? maxLength;
  final ValueChanged? onChange;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? validationKey;
  final Map<String, String> errors;
  final bool? enabled;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;

  const AppTextFieldWidget({
    Key? key,
    this.validator,
    this.controller,
    this.focusNode,
    this.hintStyle,
    this.textStyle,
    this.isLast = false,
    this.padding,
    this.hintText,
    this.labelText,
    this.onChange,
    this.suffixIcon,
    this.prefixIcon,
    this.contentPadding,
    this.height,
    this.autoCorrect = false,
    this.obscureText = false,
    this.hasBorder = true,
    this.validationKey,
    this.errors = const {},
    this.enabled,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AnimatedOpacity(
          //   opacity: ((focusNode?.hasFocus ?? false) ||
          //           (controller?.value.text.isNotEmpty ?? false))
          //       ? 1
          //       : 0,
          //   curve: Curves.easeInOutQuad,
          //   duration: const Duration(milliseconds: 800),
          //   child: Visibility(
          //     visible: ((focusNode?.hasFocus ?? false) ||
          //         (controller?.value.text.isNotEmpty ?? false)),
          //     child: Column(
          //       children: [
          //         Text(
          //           hintText ?? '',
          //           style: AppTextStyle.subHeadline,
          //         ),
          //         const SizedBox(height: 8),
          //       ],
          //     ),
          //   ),
          // ),
          if (labelText != null)
            Column(
              children: [
                Text(
                  labelText!,
                  style: AppTextStyle.subHeadline,
                ),
                const SizedBox(height: 8),
              ],
            ),
          Container(
            height: height,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              boxShadow: [AppShadow.glassEffect],
            ),
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              autocorrect: autoCorrect,
              enabled: enabled,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              validator: (val) {
                var validationMessage = validator?.call(val);
                if (validationMessage != null) return validationMessage;
                if (validationKey != null &&
                    errors.isNotEmpty &&
                    errors.containsKey(validationKey)) {
                  return errors[validationKey];
                }
              },
              obscureText: obscureText,
              textInputAction:
                  isLast ? TextInputAction.done : TextInputAction.next,
              cursorColor: Colors.black,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              onChanged: (value) {
                if (onChange != null) {
                  onChange!(value);
                }
              },
              style: textStyle ?? AppTextStyle.textFieldStyle,
              maxLines: maxLines,
              decoration: InputDecoration(
                filled: true,
                hintText: hintText ?? "",
                hintStyle: hintStyle ?? AppTextStyle.hintStyle,
                errorStyle: AppTextStyle.textFieldStyle,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                fillColor: AppColors.darkPrimary.withOpacity(0.03),
                errorBorder: _buildBorder(),
                errorMaxLines: 4,
                focusedBorder: _buildBorder(isActive: true),
                focusedErrorBorder: _buildBorder(isActive: true),
                enabledBorder: _buildBorder(),
                disabledBorder: _buildBorder(),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _buildBorder({Color? color, bool? isActive}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      gapPadding: 0.0,
      borderSide: hasBorder
          ? (isActive ?? false)
              ? const BorderSide(color: AppColors.darkPrimary)
              : BorderSide(color: color ?? AppColors.darkPrimary.withOpacity(0.3))
          : BorderSide.none,
    );
  }
}
