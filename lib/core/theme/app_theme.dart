import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.lightMainColor,
      onPrimary: AppColors.lightInputs,
      secondary: AppColors.lightMainText,
      onSecondary: AppColors.lightInputs,
      error: AppColors.lightRed,
      onError: AppColors.lightInputs,
      surface: AppColors.lightBackground,
      onSurface: AppColors.lightSecText,
      tertiary: AppColors.lightMainColor,
    ),

    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: .bold,
          color: AppColors.lightMainColor,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: .bold,
          color: AppColors.lightMainText,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: .bold,
          color: AppColors.lightMainText,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: .normal,
          color: AppColors.lightSecText,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: .normal,
          color: AppColors.lightSecText,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: .normal,
          color: AppColors.lightSecText,
        ),
        labelLarge: TextStyle(
          fontSize: 20,
          fontWeight: .w500,
          color: AppColors.lightInputs,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: .normal,
          color: AppColors.lightMainText,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: .normal,
          color: AppColors.lightMainText,
        ),
      ),
    ),

    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightMainText,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: .w500,
        color: AppColors.lightMainText,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightMainColor,
      foregroundColor: AppColors.lightInputs,
      shape: const CircleBorder(),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.lightMainColor,
        foregroundColor: AppColors.lightInputs,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        minimumSize: const Size(double.infinity, 56),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: .w500,
          color: AppColors.lightInputs,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.lightInputs,
        foregroundColor: AppColors.lightMainColor,
        side: BorderSide(width: 1, color: AppColors.lightStroke),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        minimumSize: const Size(double.infinity, 56),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: .w500,
          color: AppColors.lightMainColor,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkMainColor,
      onPrimary: AppColors.darkInputs, // Contrast against the bright blue
      secondary: AppColors.darkMainText,
      onSecondary: AppColors.darkInputs,
      error: AppColors.darkRed,
      onError: AppColors.darkMainText,
      surface: AppColors.darkBackground,
      onSurface: AppColors.darkSecText,
      tertiary: AppColors.darkMainText,
    ),

    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.darkMainColor,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.darkMainText,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.darkMainText,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.darkSecText,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.darkSecText,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.darkSecText,
        ),
        labelLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.darkMainText,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.darkMainText,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.darkMainText,
        ),
      ),
    ),

    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkMainText,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.darkMainText,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkMainColor,
      foregroundColor: AppColors.darkInputs,
      shape: const CircleBorder(),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.darkMainColor,
        foregroundColor: AppColors
            .darkInputs, // Provides better contrast against darkMainColor
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: const Size(double.infinity, 56),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.darkInputs,
        foregroundColor: AppColors.darkMainColor,
        side: const BorderSide(width: 1, color: AppColors.darkStroke),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: const Size(double.infinity, 56),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
