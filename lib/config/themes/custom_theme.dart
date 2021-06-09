import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paws/constants/custom_colors.dart';

InputDecorationTheme customInputDecorationTheme() {
  return InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: UnderlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: CustomColors.primarySwatch),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: CustomColors.primarySwatch),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0));
}

TextStyle headingStyle() {
  return GoogleFonts.rancho(fontSize: 36.0);
  // 'arimaMadurai', 'caveatBrush', 'akayaKanadaka'
}

TextStyle bodyStyle() {
  return TextStyle(color: CustomColors.secondary);
}

TextStyle linkStyle() {
  return TextStyle(color: CustomColors.primarySwatch);
}

TextStyle infoStyle() {
  return TextStyle(color: CustomColors.lightGray);
}
