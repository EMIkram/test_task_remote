import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/utils/app_colors.dart';

class AppText extends StatelessWidget {
Color? color;
double? fontSize;
FontWeight? fontWeight;
TextAlign? textAlign;
String text;
int? maxLines;

   AppText(this.text,{super.key,
   this.fontWeight = FontWeight.w600,
     this.fontSize = 14,
     this.color = AppColors.darkGrey_2D3748,
     this.textAlign,
     this.maxLines,
   });

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style:GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      )
    );
  }
}
