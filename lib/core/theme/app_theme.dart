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
      outline: AppColors.lightStroke,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.lightMainColor,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.lightMainText,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.lightMainText,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.lightSecText,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.lightSecText,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.lightSecText,
        ),
        labelLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.lightInputs,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.lightMainText,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.lightMainText,
        ),
        displaySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.lightMainColor,
        ),
        displayMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.lightSecText,
        ),
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.lightMainText,
        ),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      dividerHeight: 0,
      labelColor: AppColors.lightInputs,
      unselectedLabelColor: AppColors.lightMainText,
      labelStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.lightInputs,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.lightMainText,
      ),
      labelPadding: const EdgeInsetsGeometry.only(right: 8),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightInputs,
      selectedItemColor: AppColors.lightMainColor,
      unselectedItemColor: AppColors.lightDisable,
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.lightMainColor,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.lightMainText,
      ),
      type: BottomNavigationBarType.fixed,
    ),
    disabledColor: AppColors.lightStroke,
    dividerTheme: const DividerThemeData(
      thickness: 1,
      color: AppColors.lightStroke,
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightMainText,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.lightMainText,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightInputs,
      prefixIconColor: AppColors.lightDisable,
      suffixIconColor: AppColors.lightDisable,
      hintStyle: GoogleFonts.poppins(
        color: AppColors.lightSecText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      labelStyle: GoogleFonts.poppins(
        color: AppColors.lightSecText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.lightStroke, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.lightStroke, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.lightMainColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.lightRed, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.lightRed, width: 1),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.lightMainColor,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.lightMainColor,
          decorationThickness: 1,
        ),
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
          fontWeight: FontWeight.w500,
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
          fontWeight: FontWeight.w500,
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
      outline: AppColors.darkStroke,
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
        displaySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.darkMainColor,
        ),
        displayMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.darkSecText,
        ),
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.darkMainText,
        ),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      dividerHeight: 0,
      labelColor: AppColors.darkInputs,
      unselectedLabelColor: AppColors.darkMainText,
      labelStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkInputs,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkMainText,
      ),
      labelPadding: const EdgeInsetsGeometry.only(right: 8),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkInputs,
      selectedItemColor: AppColors.darkMainColor,
      unselectedItemColor: AppColors.darkDisable,
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.darkMainColor,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.darkMainText,
      ),
      type: BottomNavigationBarType.fixed,
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
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkInputs,
      prefixIconColor: AppColors.darkDisable,
      suffixIconColor: AppColors.darkDisable,
      hintStyle: GoogleFonts.poppins(
        color: AppColors.darkSecText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      labelStyle: GoogleFonts.poppins(
        color: AppColors.darkSecText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.darkStroke, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.darkStroke, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.darkMainColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.darkRed, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.darkRed, width: 1),
      ),
    ),
    dividerColor: AppColors.darkStroke,
    dividerTheme: const DividerThemeData(
      thickness: 1,
      color: AppColors.darkStroke,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.darkMainColor,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.darkMainColor,
          decorationThickness: 1,
        ),
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
