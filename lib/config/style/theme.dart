import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.aBeeZeeTextTheme(
      ThemeData.dark().textTheme,
    ),
    primaryColor: const Color(0xff0A0A0A),
    colorScheme: const ColorScheme.light(secondary: Colors.black),
    scaffoldBackgroundColor: const Color(0xFF0A0A0A),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
