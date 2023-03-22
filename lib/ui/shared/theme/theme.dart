import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: secondaryColor,
  fontFamily: GoogleFonts.roboto().fontFamily,
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: primaryColor
    ),
    bodyMedium: TextStyle(
      color: primaryColor
    ),
    bodyLarge: TextStyle(
      color: primaryColor
    ),
  )
);