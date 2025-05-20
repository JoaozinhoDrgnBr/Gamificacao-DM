import 'package:atividade4/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.backgroundLight,
      onPrimary: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textLight),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.textDark),
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonLight,
        foregroundColor: AppColors.textDark,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: AppColors.backgroundDark,
      elevation: 4,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardLight,
      labelStyle: TextStyle(color: AppColors.textLight),
      floatingLabelStyle: TextStyle(color: AppColors.textLight),
      hintStyle: TextStyle(color: AppColors.textLight),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor:
          AppColors.backgroundDark, // Cor do cursor// Cor do "pino" de seleção
    ),
  );
}
