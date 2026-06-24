import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // ==================== COLORS ====================
  // Backgrounds
  static const Color bg1 = Color(0xFF030B14); // Very dark background
  static const Color bg2 = Color(0xFF071220); // Dark secondary background

  // Primary Colors
  static const Color primaryColor = Color(0xFF00C896); // Green accent
  static const Color blueColor = Color(0xFF0095FF); // Blue
  static const Color orangeColor = Color(0xFFFF6B35); // Orange

  // Text Colors - LIGHT for dark backgrounds!
  static const Color textPrimary = Color(0xFFF0F8FF); // Light white/Alice blue
  static const Color textSecondary = Color(0xFF7A9BB5); // Muted gray-blue

  // Additional Colors
  static const Color borderColor = Color(0xFF1A2332);
  static const Color errorColor = Color(0xFFFF6B35); // Orange for errors
  static const Color successColor = Color(0xFF00C896); // Green for success
  static const Color warningColor = Color(0xFFFF6B35); // Orange for warnings
  static const Color infoColor = Color(0xFF0095FF); // Blue for info

  // ==================== TEXT STYLES ====================
  static const TextStyle headingLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    letterSpacing: 0.5,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    letterSpacing: 0.3,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textPrimary,
    height: 1.4,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textSecondary,
    height: 1.3,
  );

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: primaryColor,
    letterSpacing: 0.5,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );

  // ==================== THEME DATA ====================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: bg1,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: bg2,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: appBarTitle,
        iconTheme: const IconThemeData(color: primaryColor),
        toolbarHeight: 56,
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: headingLarge,
        displayMedium: headingMedium,
        displaySmall: headingSmall,
        headlineLarge: headingMedium,
        headlineMedium: headingSmall,
        headlineSmall: bodyLarge,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: bodyMedium,
        labelMedium: bodySmall,
        labelSmall: caption,
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: bg1,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: bg2,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: errorColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        hintStyle: bodySmall,
        labelStyle: bodyMedium,
        floatingLabelStyle: TextStyle(
          color: primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: bg2,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(0),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: bg2,
        selectedItemColor: primaryColor,
        unselectedItemColor: textSecondary,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: bg2,
        selectedColor: primaryColor,
        labelStyle: bodySmall,
        secondaryLabelStyle: bodySmall,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: bg2,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: bg2,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
