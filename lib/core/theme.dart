import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Core Colors
  static const Color primary = Color(0xFFFFB59A);
  static const Color primaryContainer = Color(0xFFFF5C00);
  
  static const Color surface = Color(0xFF131313);
  static const Color surfaceLowest = Color(0xFF0E0E0E);
  static const Color surfaceLow = Color(0xFF1C1B1B);
  static const Color surfaceHigh = Color(0xFF2A2A2A);
  static const Color surfaceHighest = Color(0xFF353534);
  
  static const Color secondary = Color(0xFFC8C6C5);
  static const Color onSurface = Color(0xFFE5E2E1);
  static const Color onSurfaceVariant = Color(0xFFE4BEB1);
  static const Color surfaceVariant = Color(0xFF353534);
  static const Color outlineVariant = Color(0xFF5B4137);

  // Theme Data Component
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: surface,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        primaryContainer: primaryContainer,
        surfaceTint: primary,
        surface: surface,
        onSurface: onSurface,
        onSurfaceVariant: onSurfaceVariant,
        surfaceContainerLow: surfaceLow,
        surfaceContainerHigh: surfaceHigh,
        surfaceContainerHighest: surfaceVariant,
        secondary: Color(0xFFC8C6C5),
        secondaryContainer: Color(0xFF474746),
        error: Color(0xFFFFB4AB),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.spaceGrotesk(color: onSurface, fontWeight: FontWeight.w900, fontSize: 57),
        displayMedium: GoogleFonts.spaceGrotesk(color: onSurface, fontWeight: FontWeight.bold, fontSize: 45),
        displaySmall: GoogleFonts.spaceGrotesk(color: onSurface, fontWeight: FontWeight.bold, fontSize: 36),
        headlineLarge: GoogleFonts.spaceGrotesk(color: onSurface, fontWeight: FontWeight.bold, fontSize: 32),
        headlineMedium: GoogleFonts.spaceGrotesk(color: onSurface, fontWeight: FontWeight.bold, fontSize: 28),
        headlineSmall: GoogleFonts.spaceGrotesk(color: onSurface, fontWeight: FontWeight.bold, fontSize: 24),
        titleLarge: GoogleFonts.spaceGrotesk(color: onSurface, fontWeight: FontWeight.bold, fontSize: 22),
        titleMedium: GoogleFonts.spaceGrotesk(color: onSurface, fontWeight: FontWeight.w600, fontSize: 16),
        titleSmall: GoogleFonts.spaceGrotesk(color: onSurface, fontWeight: FontWeight.w600, fontSize: 14),
        bodyLarge: GoogleFonts.manrope(color: onSurface, fontWeight: FontWeight.normal, fontSize: 16),
        bodyMedium: GoogleFonts.manrope(color: onSurface, fontWeight: FontWeight.normal, fontSize: 14),
        bodySmall: GoogleFonts.manrope(color: onSurfaceVariant, fontWeight: FontWeight.normal, fontSize: 12),
        labelLarge: GoogleFonts.manrope(color: primary, fontWeight: FontWeight.w500, fontSize: 14),
        labelMedium: GoogleFonts.manrope(color: onSurfaceVariant, fontWeight: FontWeight.w500, fontSize: 12),
        labelSmall: GoogleFonts.manrope(color: onSurfaceVariant, fontWeight: FontWeight.w500, fontSize: 11),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryContainer),
        titleTextStyle: GoogleFonts.spaceGrotesk(color: primaryContainer, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surfaceLowest.withOpacity(0.9),
        selectedItemColor: primaryContainer,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.manrope(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 10),
      ),
      dividerTheme: const DividerThemeData(
        color: surfaceVariant,
        thickness: 1,
        space: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryContainer,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: GoogleFonts.manrope(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
