import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color night900 = Color(0xFF0B0820);
  static const Color night800 = Color(0xFF14102E);
  static const Color night700 = Color(0xFF1E1745);
  static const Color lake600 = Color(0xFF2A2360);
  static const Color violet500 = Color(0xFF8B5CF6);
  static const Color magenta500 = Color(0xFFD946A8);
  static const Color dawn400 = Color(0xFFF0A8D8);
  static const Color lotus300 = Color(0xFFC9A8F0);
  static const Color ink50 = Color(0xFFF5F3FF);
  static const Color ink200 = Color(0xFFC7C1E0);
  static const Color ink400 = Color(0xFF8F87B5);
  static const Color success = Color(0xFF4ADE80);

  // Gradients
  static const LinearGradient auroraGradient = LinearGradient(
    colors: [violet500, magenta500, dawn400],
    stops: [0.0, 0.55, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient nightGradient = LinearGradient(
    colors: [night900, night800, lake600],
    stops: [0.0, 0.6, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Typography
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.outfit(
        fontSize: 56, fontWeight: FontWeight.bold, color: ink50, letterSpacing: -1.12),
    displayMedium: GoogleFonts.outfit(
        fontSize: 36, fontWeight: FontWeight.bold, color: ink50, letterSpacing: -0.72),
    headlineLarge: GoogleFonts.outfit(
        fontSize: 28, fontWeight: FontWeight.bold, color: ink50, letterSpacing: -0.56),
    titleLarge: GoogleFonts.inter(
        fontSize: 19, fontWeight: FontWeight.w600, color: ink50),
    titleMedium: GoogleFonts.inter(
        fontSize: 17, fontWeight: FontWeight.normal, color: ink200, height: 1.6),
    bodyLarge: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color: ink50),
    bodyMedium: GoogleFonts.inter(
        fontSize: 15, fontWeight: FontWeight.normal, color: ink50),
    bodySmall: GoogleFonts.inter(
        fontSize: 13, fontWeight: FontWeight.w600, color: lotus300, letterSpacing: 1.0), // Eyebrow
  );

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: night900,
      primaryColor: violet500,
      textTheme: textTheme,
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: violet500,
        secondary: magenta500,
        surface: night800,
        background: night900,
        onPrimary: Colors.white,
        onSurface: ink50,
      ),
    );
  }
}
