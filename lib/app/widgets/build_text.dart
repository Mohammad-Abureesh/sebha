import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  final bool translate;

  const BuildText({
    Key? key,
    required this.data,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.translate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(translate ? data.tr : data,
        style: GoogleFonts.cairo(
            fontSize: fontSize, color: color, fontWeight: fontWeight));
  }
}
