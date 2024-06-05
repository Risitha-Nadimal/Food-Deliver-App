import 'package:flutter/material.dart';
import 'package:food_deliver_app/util/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 15,
    this.color = primaryTextcolor,
    this.fontWeight = FontWeight.normal,
  });

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
