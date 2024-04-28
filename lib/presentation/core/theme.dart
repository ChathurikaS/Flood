import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ThemeDataX on ThemeData {
  Color get secondaryColor => const Color(0xFF959361);
  Color get backgroundLight => const Color(0xFFD9D9D9);
}

class AppTheme {
  ThemeData config() {
    return ThemeData(
        primaryColor: const Color(0xFF32B2DB),
        primaryColorLight: const Color(0xFFA1E2EB),
        scaffoldBackgroundColor: const Color(0xFF98919C),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFF32B2DB),
        ),
        textTheme: GoogleFonts.inikaTextTheme());
  }
}
