import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonWidgets {
  Widget textWidget(
      {text, maxline, align, size, color, weight, letterspace, wordheight}) {
    return Text(
      text,
      maxLines: maxline,
      textAlign: align,
      style: GoogleFonts.poppins(
        fontSize: size,
        color: color,
        fontWeight: weight,
        height: wordheight,
        letterSpacing: letterspace,
      ),
    );
  }
}
