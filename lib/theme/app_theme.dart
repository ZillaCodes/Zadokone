import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const maroon = Color(0xFF7A1F2B);
  static const maroonDark = Color(0xFF5A1420);
  static const gold = Color(0xFFC9973F);
  static const goldLight = Color(0xFFE8C990);
  static const cream = Color(0xFFFBF6EE);
  static const navy = Color(0xFF22242E);
  static const gray = Color(0xFF6B7280);
  static const surface = Color(0xFFFAFAFA);
  static const success = Color(0xFF1E9E4A);
  static const line = Color(0xFFE9E2D8);
}

class AppSpacing {
  static const double xs = 4, sm = 8, md = 16, lg = 24, xl = 32;
}

class AppRadii {
  static const double pill = 999, card = 16, field = 14;
}

class AppTheme {
  static ThemeData get light {
    final base = GoogleFonts.poppinsTextTheme();
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.surface,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.maroon,
        primary: AppColors.maroon,
        secondary: AppColors.gold,
        surface: AppColors.surface,
      ),
      textTheme: base.copyWith(
        headlineLarge: GoogleFonts.poppins(fontSize: 34, fontWeight: FontWeight.w700, height: 1.2, color: AppColors.navy),
        headlineMedium: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.maroon),
        titleLarge: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.navy),
        titleMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.navy),
        bodyLarge: GoogleFonts.poppins(fontSize: 15, height: 1.65, color: AppColors.navy),
        bodyMedium: GoogleFonts.poppins(fontSize: 13, height: 1.5, color: AppColors.gray),
        labelLarge: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: GoogleFonts.poppins(color: const Color(0xFF9CA3AF), fontSize: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadii.field), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadii.field), borderSide: const BorderSide(color: AppColors.line)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadii.field), borderSide: const BorderSide(color: AppColors.gold, width: 1.4)),
      ),
    );
  }
}
