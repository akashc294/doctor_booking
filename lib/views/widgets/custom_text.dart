import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText{
  static Widget richText(String text,Widget icon,{Color colors=Colors.black,FontWeight fontWeight=FontWeight.w600,double fontSize=14,EdgeInsets margin = EdgeInsets.zero}){
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(color: colors, fontSize: fontSize, fontWeight: fontWeight ),
        children: [
          WidgetSpan(
            child: Container(
                margin: margin,
                child: icon),
          ),
          TextSpan(
            text: text,
          ),
        ],
      ),
    );
  }

  static Widget text(String text,{FontWeight fontWeight=FontWeight.normal, Color color=Colors.black, double fontSize=14.0,FontStyle fontStyle = FontStyle.normal,TextOverflow overFlow=TextOverflow.visible, int? maxLines,TextAlign textAlign=TextAlign.start,String? fontFamily}) {
    fontFamily = fontFamily??GoogleFonts.montserrat().fontFamily;
    return Text(
        text,
        overflow:overFlow,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily,
        )
    );
  }
}