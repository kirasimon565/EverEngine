import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color surfaceColor = Color(0xFF1E1E1E);
  static const Color canvasColor = Color(0xFF121212);
  static const Color accentColor = Color(0xFF03DAC6);
  static const Color errorColor = Color(0xFFCF6679);
  static const Color successColor = Color(0xFF4CAF50);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: canvasColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: accentColor,
        surface: surfaceColor,
        error: errorColor,
      ),
      cardTheme: const CardTheme(
        color: surfaceColor,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData.light(); // Placeholder for light theme
  }
}
