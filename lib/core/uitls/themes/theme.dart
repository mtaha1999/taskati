import 'package:flutter/material.dart';
import 'package:taskati/core/uitls/color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'poppins',
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.colorPrimary, onSurface: AppColors.blackColor),
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontFamily: 'poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor),
      backgroundColor: AppColors.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
          fontFamily: 'poppins',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.colorPrimary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.colorPrimary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.redColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.redColor,
        ),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'poppins',
    scaffoldBackgroundColor: AppColors.darkScaffoldBg,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.colorPrimary, onSurface: AppColors.whiteColor),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: AppColors.darkScaffoldBg,
      titleTextStyle: TextStyle(
        fontFamily: 'poppins',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkScaffoldBg,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
          fontFamily: 'poppins',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.colorPrimary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.colorPrimary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.redColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.redColor,
        ),
      ),
    ),
  );
}
