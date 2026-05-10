import 'package:flutter/material.dart';

class AppTheme {
  // Dark palette
  static const darkPrimary = Color(0xFF2F2FE4);
  static const darkSecondary = Color(0xFF162E93);
  static const darkSurface = Color(0xFF1A1953);
  static const darkBackground = Color(0xFF080616);

  // Light palette — richer, higher contrast
  static const lightBackground = Color(0xFFF0F4FF);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightCard = Color(0xFFE8EEFF);
  static const lightPrimary = Color(0xFF2F2FE4);
  static const lightSecondary = Color(0xFF162E93);
  static const lightOnBackground = Color(0xFF0D0D2B);
  static const lightOnSurface = Color(0xFF1A1953);

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: darkBackground,
        colorScheme: const ColorScheme.dark(
          primary: darkPrimary,
          secondary: darkSecondary,
          surface: darkSurface,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: darkBackground,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: darkSurface,
          indicatorColor: darkPrimary.withValues(alpha: 0.3),
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ),
        cardTheme: CardThemeData(
          color: darkSurface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkPrimary,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: darkPrimary),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(color: Colors.white70),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        useMaterial3: true,
      );

  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: lightBackground,
        colorScheme: const ColorScheme.light(
          primary: lightPrimary,
          secondary: lightSecondary,
          surface: lightSurface,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: lightOnSurface,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: lightBackground,
          foregroundColor: lightOnBackground,
          elevation: 0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: lightSurface,
          indicatorColor: lightPrimary.withValues(alpha: 0.15),
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(color: lightOnSurface, fontSize: 12),
          ),
        ),
        cardTheme: CardThemeData(
          color: lightCard,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightPrimary,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: lightPrimary,
            side: const BorderSide(color: lightPrimary),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              color: lightOnBackground, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: lightOnBackground, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
              color: lightOnBackground, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(color: lightOnSurface),
          bodyLarge: TextStyle(color: lightOnBackground),
          bodyMedium: TextStyle(color: lightOnSurface),
        ),
        useMaterial3: true,
      );
}
