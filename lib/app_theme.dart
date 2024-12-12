import 'package:flutter/material.dart';
import 'package:insight_gpt/Resources/Constants/App_Colors.dart';

class AppTheme {
  // Light theme
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: AppColors.Intro_BackGround_White,
      primary: AppColors.geminiChatAppBarColor,
      secondary: AppColors.geminiChatAppBarColor,
    ),
    brightness: Brightness.light,
    primarySwatch: Colors.red,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
    useMaterial3: true,
  );

  // Dark theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade600,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  );
}
