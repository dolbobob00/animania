import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../data/constants.dart';

class AppThemes {
  static const _baseTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 65,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontFamily: 'LeagueSpartan',
      fontWeight: FontWeight.w500,
    ),
  );

  static ThemeData getThemeData(AppThemeType type) {
    switch (type) {
      case AppThemeType.orange:
        return _orangeTheme;
      case AppThemeType.purple:
        return _purpleTheme;
      default:
        return _orangeTheme;
    }
  }

  static final ThemeData _purpleTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      background: AppColors.purpleBg,
      primary: AppColors.purpleLight,
      secondary: AppColors.purplePale,
      surface: AppColors.purpleDark,
    ),
    scaffoldBackgroundColor: AppColors.purpleBg,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.purpleDark,
      foregroundColor: Colors.white,
    ),
    textTheme: _baseTextTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );

  static final ThemeData _orangeTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      background: AppColors.orangeBg,
      primary: AppColors.orangePrimary,
      secondary: AppColors.orangeLight,
      surface: AppColors.orangePale,
    ),
    scaffoldBackgroundColor: AppColors.orangeBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.orangePrimary,
      foregroundColor: Colors.white,
    ),
    textTheme: _baseTextTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
  );
}
