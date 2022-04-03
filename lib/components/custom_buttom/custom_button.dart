import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtom extends StatelessWidget {
  //
  final double? height;
  final double? vertical;
  final double? horizontal;
  final double? fontSize;
  final double? borderRadius;
  final String? imageUrl;
  final bool? hasImage;
  final String? buttonText;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Color? borderColor;
  final Function? onTap;

  const CustomButtom({
    Key? key,
    this.imageUrl,
    this.hasImage,
    this.buttonText,
    this.buttonColor,
    this.buttonTextColor,
    this.onTap,
    this.height = 60.0,
    this.vertical,
    this.horizontal,
    this.borderRadius = 32.0,
    this.borderColor = Colors.white,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        height: height,
        padding:
            EdgeInsets.symmetric(horizontal: horizontal!, vertical: vertical!),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            hasImage!
                ? SizedBox(
                    width: 35,
                    height: 40,
                    child: Image.network(imageUrl!),
                  )
                : const SizedBox(),
            const SizedBox(
              width: 0,
            ),
            Text(
              buttonText!,
              style: GoogleFonts.openSans(
                  color: buttonTextColor!,
                  fontSize: fontSize!,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor!),
          color: buttonColor!,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
    );
  }
}
