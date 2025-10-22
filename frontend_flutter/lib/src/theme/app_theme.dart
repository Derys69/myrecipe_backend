import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF4CAF50),
      brightness: Brightness.light,
    );
    return base.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).copyWith(
        titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        bodyMedium: GoogleFonts.poppins(),
      ),
      cardTheme: const CardThemeData(
        elevation: 2,
        margin: EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 1,
        centerTitle: false,
      ),
    );
  }

  static ThemeData dark() {
    final base = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF4CAF50),
      brightness: Brightness.dark,
    );
    return base.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).copyWith(
        titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        bodyMedium: GoogleFonts.poppins(),
      ),
      cardTheme: const CardThemeData(
        elevation: 2,
        margin: EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0.5,
        centerTitle: false,
      ),
    );
  }
}

