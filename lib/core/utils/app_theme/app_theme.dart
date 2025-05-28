import 'package:emaar/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_fonts.dart';

class AppTheme {
  const AppTheme._();

  // light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: AppFonts.balooBhaijaan2,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.primaryBackgrond,
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.heading26,
        headlineMedium: AppTextStyles.heading24,
      ),
    );
  }

  // dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: AppFonts.balooBhaijaan2,
    );
  }
}
