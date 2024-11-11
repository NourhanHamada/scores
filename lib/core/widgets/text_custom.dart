import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theming/colors_manager.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign? textAlign;
  final double height;
  final TextDecoration textDecoration;
  final Color? decorationColor;
  final Paint? linearGradient;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final Color? backgroundColor;
  final String? fontFamily;
  final List<Shadow>? shadow;

  const TextCustom({
    super.key,
    required this.text,
    this.color = ColorsManager.blackColor,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 16,
    this.textAlign = TextAlign.start,
    this.height = 1.2,
    this.textDecoration = TextDecoration.none,
    this.linearGradient,
    this.decorationColor,
    this.textOverflow,
    this.textDirection,
    this.backgroundColor,
    this.fontFamily,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        overflow: textOverflow,
        textAlign: textAlign ?? TextAlign.left,
        style: GoogleFonts.balooBhai2(
          decoration: textDecoration,
          decorationColor: decorationColor,
          decorationThickness: 1.5,
          fontSize: fontSize,
          shadows: shadow,
          color: color,
          fontWeight: fontWeight,
          height: height,
          foreground: linearGradient,
        ));
  }
}
