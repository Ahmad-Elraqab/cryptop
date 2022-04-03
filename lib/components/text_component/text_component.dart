import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final Color? textColor;
  final TextAlign? align;
  final FontWeight? weight;
  final int? line;

  const TextComponent({
    Key? key,
    this.title,
    this.fontSize,
    this.textColor,
    this.align,
    this.weight,
    this.line,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      maxLines: line!,
      textAlign: align!,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          color: textColor!,
          fontSize: fontSize!,
          fontWeight: weight!,
        ),
      ),
    );
  }
}
