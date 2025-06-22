import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double textSize28 = 28; // Headings
double textSize24 = 24; //
double textSize20 = 20; // Sub Headings
double textSize14 = 14; // Default
double textSize12 = 12; // Links

extension ExtendedTextStyle on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get black => copyWith(fontWeight: FontWeight.w900);

  TextStyle setColor(Color color) => copyWith(color: color);
  TextStyle setBackground(Color color) => copyWith(backgroundColor: color);

}

class AppTextStyle {
  static const double _height = 1.4;

  // Basis-Textstil mit Noto Sans
  static final TextStyle _defaultStyle = GoogleFonts.getFont(
    'Noto Sans',
    fontSize: textSize14,
    height: _height,
    fontWeight: FontWeight.w400,
  );

  // Spezielle Cardo-Stile (für dekorative oder besondere Texte)
  static final TextStyle _cardoStyle = GoogleFonts.getFont(
    'Cardo',
    fontSize: textSize14,
    height: _height,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyleRegular({double fontSize = 14}) {
    return _defaultStyle.copyWith(fontSize: fontSize, fontWeight: FontWeight.w400);
  }

  static TextStyle textStyleMedium({double fontSize = 14}) {
    return _defaultStyle.copyWith(fontSize: fontSize, fontWeight: FontWeight.w500);
  }

  static TextStyle textStyleSemiBold({double fontSize = 14}) {
    return _defaultStyle.copyWith(fontSize: fontSize, fontWeight: FontWeight.w600);
  }

  static TextStyle textStyleBold({double fontSize = 14}) {
    return _defaultStyle.copyWith(fontSize: fontSize, fontWeight: FontWeight.w700);
  }

  static TextStyle textStyleBlack({double fontSize = 14}) {
    return _defaultStyle.copyWith(fontSize: fontSize, fontWeight: FontWeight.w900);
  }

  static TextStyle labelStyle() {
    return GoogleFonts.getFont('Noto Sans', fontSize: textSize12, fontWeight: FontWeight.w400);
  }

  // Spezialstil für dekorativen Text mit Cardo
  static TextStyle decorativeTextRegular({double fontSize = 14}) {
    return _cardoStyle.copyWith(fontSize: fontSize, fontWeight: FontWeight.normal);
  }

  static TextStyle decorativeTextBold({double fontSize = 14}) {
    return _cardoStyle.copyWith(fontSize: fontSize, fontWeight: FontWeight.bold);
  }
}
