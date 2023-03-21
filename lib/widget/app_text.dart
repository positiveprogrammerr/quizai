import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final Color color;
  final double size;
  final String? text;
  final FontWeight? fontWeight;
  final TextAlign textAlign;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const AppText(
    this.text, {
    Key? key,
    this.color = Colors.black,
    this.size = 16,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.left,
    this.style,
    this.maxLines,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: style ??
          GoogleFonts.montserrat(
            color: color,
            fontSize: size,
            height: 1.2,
            fontWeight: fontWeight,
          ),
    );
  }
}
